class API::V1::PostulatesController < ApplicationController
  before_action :set_postulate, only: [:show, :update]
  #before_action :authenticate_user!, only:[:create, :destroy]

  # GET /postulates
  def index
    @postulates = Postulate.all

    render json: @postulates
  end

  # GET /postulates/1
  def show
    render json: @postulate
  end

  # POST /postulates
  def create
    #user_id= current_user.id
    user_id=params[:user_id]
    question_id=params[:question_id]
    @postulate = Postulate.new(:user_id => user_id, :question_id => question_id)
    if @postulate.save
      render json: @postulate, status: :created
    else
      render json: @postulate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /postulates/1
  def update
    if @postulate.update(postulate_params)
      render json: @postulate
    else
      render json: @postulate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /postulates/1
  def destroy
    #user_id= current_user.id
    user_id=params[:user_id]
    question_id=params[:question_id]
    @postulate = Postulate.find_by(:user_id => user_id, :question_id => question_id)
    @postulate.destroy
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulate
      @postulate = Postulate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def postulate_params
      params.require(:postulate).permit(:user_id, :question_id)
    end
end
