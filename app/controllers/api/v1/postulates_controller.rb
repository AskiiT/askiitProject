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
    user_id= current_user.id
    #user_id=params[:user_id]
    question_id=params[:question_id]
    @postulate = Postulate.new(:user_id => user_id, :question_id => question_id)
    @question = Question.find_by_id(question_id)
    
    if @postulate.save
      q_user_id=Question.find_by_id(question_id).user_id
      username=current_user.username
      #username=User.find_by_id(user_id).username
      body=username+" se ha postulado a tu pregunta."
      @nota = Notification.new(:body=> body, :read=> 0, :user_id=>q_user_id, :question_id => question_id)
      @nota.save
      render json: @question
    else
      render json: @postulate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /postulates/1
  def update
    render json: 
        { data:
          {
            error: "No puede editar postulaciones. Solo borrarlas y crearlas."
          }
    }
  end

  # DELETE /postulates/1
  def destroy
    user_id= current_user.id
    question_id=params[:question_id]
    @postulate = Postulate.find_by(:user_id => user_id, :question_id => question_id)
    @postulate.destroy
    @question = Question.find_by_id(question_id)
    render json: @question
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
