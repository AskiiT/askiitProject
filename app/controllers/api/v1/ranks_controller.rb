class API::V1::RanksController < ApplicationController
  before_action :set_rank, only: [:show, :update, :destroy]

  # GET /ranks
  def index
    @ranks = Rank.all

    render json: @ranks
  end

  # GET /ranks/1
  def show
    render json: @rank
  end

  # POST /ranks
  def create
    @rank = Rank.new(rank_params)

    if @rank.save
      render json: @rank, status: :created, location: @rank
    else
      render json: @rank.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ranks/1
  def update
    if @rank.update(rank_params)
      render json: @rank
    else
      render json: @rank.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ranks/1
  def destroy
    @rank.destroy
  end

  def by_user
    uid = params[:user_id]
    integerUid = uid.to_i
    if integerUid.to_s == uid.to_s
      @rank = Rank.rank_of_user(uid)
    else
      f = User.users_id_name(uid)
      @rank = Rank.rank_of_user(f.to_i)
    end
    render json: @rank
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rank
      @rank = Rank.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rank_params
      params.require(:rank).permit(:clarity, :quickness, :efectiveness, :user_id)
    end
end
