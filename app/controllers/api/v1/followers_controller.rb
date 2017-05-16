class API::V1::FollowersController < ApplicationController
  #before_action :set_follower, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only:[:create, :destroy]
  # GET /followers

  def translate(s)
    s=s.upcase
    case s
    when '-DATE'
      s=1
    when 'DATE'
      s=2
    when'-USERNAME'
      s=3
    when 'USERNAME'
      s=4
    when '-FIRST_NAME'
      s=5
    when 'FIRST_NAME'
      s=6
    when '-LAST_NAME'
      s=7
    when 'LAST_NAME'
      s=8
    when '-DESCRIPTION'
      s=9
    when 'DESCRIPTION'
      s=10
    when '-EMAIL'
      s=11
    when 'EMAIL'
      s=12
    when '-ID'
      s=13
    when 'ID'
      s=14
    when '-COLOR'
      s=15
    when 'COLOR'
      s=16
    else
      s=1
    end
  end

  def getCols(arr, query)
    parameters=['first_name', 'last_name', 'username', 'email', 'color', 'date_created', 'id']
    por=arr & parameters
    cols=[]
    endjson=query
    unless por.empty?
      if por.include?('id')
        cols.push(:id)
      end
      if por.include?('username')
        cols.push(:username)
      end
      if por.include?('email')
        cols.push(:email)
      end
      if por.include?('first_name')
        cols.push(:first_name)
      end
      if por.include?('last_name')
        cols.push(:last_name)
      end
      if por.include?('color')
        cols.push(:color)
      end
      if por.include?('date_created')
        cols.push(:date_created)
      end
      cols.push(:rank)
      endjson=endjson.to_json(:only => cols)
    end
    endjson
  end

  def index
    g=params[:user_id]
    m=g.to_i

    unless m.to_s == g.to_s
      f=User.users_id_name(g)
      g=f.to_i
    end

    s = params[:sort]
    if s.nil?
      s = 13
    else
      s = translate(s)
    end

    @followers = User.user_followers(g, sort=s).page(params[:page])
    q=params[:q]
    unless q.nil?
      @followers=@followers.where("lower(users.username) LIKE ?", "%#{q.downcase}%")
    end

    el=params[:select_users]
    unless el.nil?
      el=el.split(",")
      el=el.map(&:downcase)
      @followers=getCols(el, @followers)
    end
    if @followers.empty?
        render json: 
          { data:
            {
              error: "No more followers to show."
            }
          }
      else
        render json: @followers
      end
  end


  def following
    g=params[:user_id]
    m=g.to_i

    unless m.to_s == g.to_s
      f=User.users_id_name(g)
      g=f.to_i
    end

    s = params[:sort]
    if s.nil?
      s = 13
    else
      s = translate(s)
    end

    @following = User.user_follows(g, sort=s).page(params[:page])
    q=params[:q]
    unless q.nil?
      @following=@following.where("lower(users.username) LIKE ?", "%#{q.downcase}%")
    end
    el=params[:select_users]
    unless el.nil?
      el=el.split(",")
      el=el.map(&:downcase)
      @following=getCols(el, @following)
    end
    
    if @following.empty?
      render json: 
        { data:
            {
              error: "No more follows to show."
            }
        }
    else
        render json: @following
    end

  end

  # GET /followers/1
  def show
    render json: @follower
  end

  # POST /followers
  def create
    my_id = current_user.id
    followed = params[:user_id]

    @follower = Follower.new(:followed_id => followed, :follower_id => my_id)
    @user_id=User.user_followers(followed)
    if @follower.save
      FollowersMailer.followed(User.find(followed), User.find(my_id)).deliver
      render json: @user_id, status: :created
    else
      render json: @follower.errors, status: :unprocessable_entity
    end
  end

  # DELETE /followers/1
  def destroy
    my_id = current_user.id
    followed = params[:user_id]

    @follower = Follower.find_by(:followed_id => followed, :follower_id => my_id)
    @follower.destroy
    @user_id=User.user_followers(followed)
    render json: @user_id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follower
      @follower = Follower.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def follower_params
    #   params.require(:follower).permit( :user_id, :follower_id )
    # end
end
