class API::V1::DomainRanksController < ApplicationController
  before_action :set_domain_rank, only: [:show, :update, :destroy]

  # GET /domain_ranks
  def index
    @domain_ranks = DomainRank.all

    render json: @domain_ranks
  end

  # GET /domain_ranks/1
  def show
    render json: @domain_rank
  end

  # POST /domain_ranks
  def create
    @domain_rank = DomainRank.new(domain_rank_params)

    if @domain_rank.save
      render json: @domain_rank, status: :created, location: @domain_rank
    else
      render json: @domain_rank.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /domain_ranks/1
  def update
    if @domain_rank.update(domain_rank_params)
      render json: @domain_rank
    else
      render json: @domain_rank.errors, status: :unprocessable_entity
    end
  end

  # DELETE /domain_ranks/1
  def destroy
    @domain_rank.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domain_rank
      @domain_rank = DomainRank.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def domain_rank_params
      params.require(:domain_rank).permit(:level, :user_id, :topic_id)
    end
end