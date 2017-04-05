class API::V1::FollowersController < ApplicationController
  before_action :set_follower, only: [:show, :update, :destroy]

  # GET /followers
  def index
    g=params[:user_id]
    m=g.to_i
    if m.to_s == g.to_s
      @followers = User.user_followers(g)
    else
      f=User.users_id_name(g)
      @followers = User.user_followers(f.to_i)
    end
    render json: @followers
  end

  def following
    g=params[:user_id]
    m=g.to_i
    if m.to_s == g.to_s
      @followers = User.user_follows(g)
    else
      f=User.users_id_name(g)
      @followers = User.user_follows(f.to_i)
    end
    render json: @followers
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
