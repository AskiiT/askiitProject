class API::V1::RanksController < ApplicationController
  before_action :set_rank, only: [:show, :update, :destroy]

  # GET .../users/:id/ranks
  def index
    inputId = params[:user_id]
    integerUid = inputId.to_i
    stringUid = inputId.to_s

    integerUid.to_s == stringUid ? id = integerUid : id = User.users_id_name(stringUid)

    @rank = Rank.rank_of_user(id)

    render json: @rank
  end

  # GET ranks/1
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
