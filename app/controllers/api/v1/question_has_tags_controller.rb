class API::V1::QuestionHasTagsController < ApplicationController
  before_action :set_question_has_tag, only: [:show, :update ]
  before_action :authenticate_user!, only:[:create, :destroy]
  # GET /question_has_tags
  def index
    @question_has_tags = QuestionHasTag.all
    
    render json: @question_has_tags
  end

  # GET /question_has_tags/1
  def show
    render json: @question_has_tag
  end

  # POST /question_has_tags
  def create
    @question_has_tag = QuestionHasTag.new
    tag_id=params[:tag_id]
    question_id=params[:question_id]
    unless Question.find_by_id(question_id).user_id==current_user.id
        render json: 
        { data:
          {
            error: "Usted no puede ponerle tags a esta pregunta"
          }
        }
    else
      name=tag_id
      ta_id=Tag.tag_id_name(name)

      if ta_id<0
        topic=Question.find_by_id(question_id).topic_id
        QuestionHasTag.tag_created(name, topic)
        ta_id=Tag.tag_id_name(name)
      end
      @question_has_tag.tag_id=ta_id
      @question_has_tag.question_id=question_id

      if @question_has_tag.save
        render json: @question_has_tag, status: :created
      else
        render json: @question_has_tag.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /question_has_tags/1
  def update
    if @question_has_tag.update(question_has_tag_params)
      render json: @question_has_tag
    else
      render json: @question_has_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /question_has_tags/1
  def destroy
    tag_id = params[:tag_id]
    question_id = params[:question_id]
    unless Question.find_by_id(question_id).user_id == current_user.id
      render json:
      {
        data:
        {
          error: "No está autorizado para borrar tags a esta pregunta"
        }
      }
    else
      name = tag_id
      ta_id = Tag.tag_id_name(name)
      if ta_id < 0
        render json:
        {
          data:
          {
            error: "No puede eliminar el tag no existe."
          }
        }
      else
        @question = QuestionHasTag.find_by( :question_id => question_id, :tag_id => ta_id )
        if @question.nil?
          render json:
          {
            data:
            {
              error: "No puede eliminar, el tag no está asociado a la pregunta."
            }
          }
        else
          @question.destroy
        end
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_has_tag
      @question_has_tag = QuestionHasTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_has_tag_params
      params.require(:question_has_tag).permit(:question_id, :tag_id)
    end
end
