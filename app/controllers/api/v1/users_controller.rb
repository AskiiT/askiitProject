class API::V1::UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]
	before_action :authenticate_user!, only:[:welcome]
  
  def welcome
    @user= current_user
    render json:          
    { data:
            {
              message: ""+current_user.username
            }
          }
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
      s=14
    end
  end

	def index
		p = params[:page]

    s = params[:sort]
    if s.nil?
      s = 14
    else
      s = translate(s)
    end

		unless p.nil?
			@users = User.load_users(sort=s).page(p)
		else
			@users = User.whole(sort=s)
		end
    q=params[:q]
    unless q.nil?
      @users=@users.where("lower(users.username) LIKE ?", "%#{q.downcase}%")
    end

    el=params[:select_users]
    unless el.nil?
      el=el.split(",")
      el=el.map(&:downcase)
      @users=getCols(el, @users)
    end
  	if @users.empty?
			render json: 
				{ data:
					{
						error: "No more users to show."
					}
				}
		else
  		render json: @users
		end
  	end
  	
	def show
		g=params[:id]
		m=g.to_i


		if m.to_s == g.to_s
			@user = User.find(params[:id])
		else
			@user = User.user_username(params[:id])
		end

    el=params[:select_users]
    unless el.nil?
      el=el.split(",")
      el=el.map(&:downcase)
      @user=getCols(el, @user)
    end


    if @user.nil?
       render json: 
         { data:
           {
             error: "User wasn't found"
           }
         }
     else      
    render json: @user
     end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topics/1
  def destroy
    @user.destroy
  end

	#####
	#Custom Routes 
	#####
  #Encuentra un usuario por coincidencia
	def search_username
		s = params[:sort]
    if s.nil?
      s = 14
    else
      s = translate(s)
    end

    @users=User.users_by_username(params[:username], sort=s).page(params[:page])
    
    q=params[:q]
    unless q.nil?
      @users=@users.where("lower(users.username) LIKE ?", "%#{q.downcase}%")
    end

    el=params[:select_users]
    unless el.nil?
      el=el.split(",")
      el=el.map(&:downcase)
      @user=getCols(el, @user)
    end
		if @users.empty?
  			render json: 
  				{ data:
  					{
  						error: "No more users to show."
  					}
  				}
  		else
    		render json: @users
  		end
	end

	def search_firstname
    s = params[:sort]
    if s.nil?
      s = 14
    else
      s = translate(s)
    end
		@users=User.users_by_firstname(params[:username], sort=s).page(params[:page])



    el=params[:select_users]
    unless el.nil?
      el=el.split(",")
      el=el.map(&:downcase)
      @user=getCols(el, @user)
    end
		if @users.empty?
  			render json: 
  				{ data:
  					{
  						error: "No more users to show."
  					}
  				}
  		else
    		render json: @users
  		end
	end
	
	def search_lastname
    s = params[:sort]
    if s.nil?
      s = 14
    else
      s = translate(s)
    end
		@users=User.users_by_firstname(params[:username], sort=s).page(params[:page])

    el=params[:select_users]
    unless el.nil?
      el=el.split(",")
      el=el.map(&:downcase)
      @user=getCols(el, @user)
    end
		if @users.empty?
  			render json: 
  				{ data:
  					{
  						error: "No more users to show."
  					}
  				}
  		else
    		render json: @users
  		end
	end

  def search_email
    s = params[:sort]
    if s.nil?
      s = 14
    else
      s = translate(s)
    end
    email = params[:email]
    @users=User.user_by_email(email.gsub('*', '.'), sort=s)


    el=params[:select_users]
    unless el.nil?
      el=el.split(",")
      el=el.map(&:downcase)
      @user=getCols(el, @user)
    end
    if @users.empty?
        render json: 
          { data:
            {
              error: "There is no user with this email."
            }
          }
      else
        render json: @users
      end
  end


  #####
  #Other routes
  #####
  def who_postulated
    @users=User.postulated_to_user(params[:user_id]).page(params[:page])
    

    q=params[:q]
    unless q.nil?
      @users=@users.where("lower(users.username) LIKE ?", "%#{q.downcase}%")
    end

    el=params[:select_users]
    unless el.nil?
      el=el.split(",")
      el=el.map(&:downcase)
      @users=getCols(el, @users)
    end

    if @users.empty?
    render json: 
        { data:
          {
            error: "No more users to show."
          }
        }
    else
      render json: @users
    end
  end
  def who_it_postulated
    @users=User.who_it_postulated(params[:user_id]).page(params[:page])
    
    q=params[:q]
    unless q.nil?
      @users=@users.where("lower(users.username) LIKE ?", "%#{q.downcase}%")
    end

    el=params[:select_users]
    unless el.nil?
      el=el.split(",")
      el=el.map(&:downcase)
      @users=getCols(el, @users)
    end

    if @users.empty?
    render json: 
        { data:
          {
            error: "No more users to show."
          }
        }
    else
      render json: @users
    end
    
  end

  def sort
    g=params[:by]
    
    if g.nil?
      g='clarity'
    else
      g=g.downcase
    end

    if g=='clarity'
      @users=User.user_by_clarity.page(params[:page])
    elsif g=='quickness'
      @users=User.user_by_quickness.page(params[:page])
    elsif g== 'efectiveness'
      @users=User.user_by_efectiveness.page(params[:page])
    else
      @users=nil
    end

    if @users.empty?
    render json: 
        { data:
          {
            error: "No users to show."
          }
        }
    else
      render json: @users
    end
  end

  def by_level
    g=params[:topic]
    unless g.nil?
      m=g.to_i
      
      if m.to_s != g.to_s
        u=Topic.topic_id_name(params[:topic])
        g=u.to_i
      end
      @users=User.users_by_domain_rank_level(g).page(params[:page])

      if @users.empty?
      render json: 
          { data:
            {
              error: "No users to show."
            }
          }
      else
        render json: @users
      end
    else
        render json: 
      { data:
        {
          error: "Topic missing"
        }
      }
    end
  end

  def postulated_to
    s = params[:sort]
    if s.nil?
      s = 14
    else
      s = translate(s)
    end
    @postulate=User.users_by_question(params[:question_id], sort=s).page(params[:page])
    
    q=params[:q]
    unless q.nil?
      @postulate=@postulate.where("lower(users.username) LIKE ?", "%#{q.downcase}%")
    end

    el=params[:select_users]
    unless el.nil?
      el=el.split(",")
      el=el.map(&:downcase)
      @postulate=getCols(el, @postulate)
    end
    
    if @postulate.empty?
        render json: 
          { data:
            {
              error: "No more postulates to show."
            }
          }
    else
        render json: @postulate
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :color, :avatar_id, :date_created, :description, :password)
    end

end
