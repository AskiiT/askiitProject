class API::V1::DomainRanksController < ApplicationController
  before_action :set_domain_rank, only: [:show, :update, :destroy]

  # GET /domain_ranks
  def index
    @domain_ranks = DomainRank.all

    render json: @domain_ranks
  end

  def by_user
    uid = params[:user_id]
    page = params[:page]
    integerUid = uid.to_i
    if integerUid.to_s == uid.to_s
      @dranks = DomainRank.domain_ranks_by_user_id(uid)
    else
      f = User.users_id_name(uid)
      @dranks = DomainRank.domain_ranks_by_user_id(f.to_i)
    end
    render json: @dranks
  end

  def by_user_and_topic
    uid = params[:user_id]
    tid = params[:topic_id]

    integerUid = uid.to_i
    if integerUid.to_s == uid.to_s
      @drank = DomainRank.domain_ranks_by_user_id_and_topic(uid, tid)
    else
      f = User.users_id_name(uid)
      @drank = DomainRank.domain_ranks_by_user_id_and_topic(f.to_i, tid)
    end
    render json: @drank
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