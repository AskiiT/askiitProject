class DomainRanksController < ApplicationController
  before_action :set_domain_rank, only: [:show, :edit, :update, :destroy]

  # GET /domain_ranks
  # GET /domain_ranks.json
  def index
    @domain_ranks = DomainRank.all
  end

  # GET /domain_ranks/1
  # GET /domain_ranks/1.json
  def show
  end

  # GET /domain_ranks/new
  def new
    @domain_rank = DomainRank.new
  end

  # GET /domain_ranks/1/edit
  def edit
  end

  # POST /domain_ranks
  # POST /domain_ranks.json
  def create
    @domain_rank = DomainRank.new(domain_rank_params)

    respond_to do |format|
      if @domain_rank.save
        format.html { redirect_to @domain_rank, notice: 'Domain rank was successfully created.' }
        format.json { render :show, status: :created, location: @domain_rank }
      else
        format.html { render :new }
        format.json { render json: @domain_rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /domain_ranks/1
  # PATCH/PUT /domain_ranks/1.json
  def update
    respond_to do |format|
      if @domain_rank.update(domain_rank_params)
        format.html { redirect_to @domain_rank, notice: 'Domain rank was successfully updated.' }
        format.json { render :show, status: :ok, location: @domain_rank }
      else
        format.html { render :edit }
        format.json { render json: @domain_rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domain_ranks/1
  # DELETE /domain_ranks/1.json
  def destroy
    @domain_rank.destroy
    respond_to do |format|
      format.html { redirect_to domain_ranks_url, notice: 'Domain rank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domain_rank
      @domain_rank = DomainRank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def domain_rank_params
      params.require(:domain_rank).permit(:level, :user_id, :topic_id)
    end
end
