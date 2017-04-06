class API::V1::FollowersController < ApplicationController
  before_action :set_follower, only: [:show, :update, :destroy]

  # GET /followers
  def index
    g=params[:user_id]
    m=g.to_i

    unless m.to_s == g.to_s
      f=User.users_id_name(g)
      g=f.to_i
    end
    @followers = User.user_followers(g).page(params[:page])

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
    @following = User.user_follows(g).page(params[:page])

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
    @follower = Follower.new(follower_params)

    if @follower.save
      render json: @follower, status: :created, location: @follower
    else
      render json: @follower.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /followers/1
  def update
    if @follower.update(follower_params)
      render json: @follower
    else
      render json: @follower.errors, status: :unprocessable_entity
    end
  end

  # DELETE /followers/1
  def destroy
    @follower.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follower
      @follower = Follower.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def follower_params
      params.fetch(:follower, {})
    end
end
