class API::V1::QuestionAttachmentsController < ApplicationController
  before_action :set_question_attachment, only: [:update]
  before_action :authenticate_user!, only:[:create, :destroy, :update]

  # GET /question_attachments
  def index
    @question_attachments=QuestionAttachment.get_attachments(params[:question_id]).page(params[:page])
    if @question_attachments.empty?
      render json: 
        { data:
          {
            error: "No more attachments to show."
          }
        }
    else
      render json: @question_attachments
    end

  end

  # GET /question_attachments/1
  def show

    @question_attachment = QuestionAttachment.find(params[:id])
    if (@question_attachment.question_id.to_i)==(params[:question_id].to_i)
     render json: @question_attachment
    else
      #render json: @question_attachment.question_id
      render json: nil
    end
      
  end

  # POST /question_attachments
  def create
    @question_attachment = QuestionAttachment.new(question_attachment_params)
    question_id=params[:question_id]
    @question_attachment.question_id=question_id;
    if Question.find_by_id(question_id).user_id==current_user.id
      if @question_attachment.save
        render json: @question_attachment, status: :created
      else
        render json: @question_attachment.errors, status: :unprocessable_entity
      end
    else
      render json: 
        { data:
          {
            error: "Usted no puede adjuntar archivos a esta pregunta"
          }
        }
    end  
  end
  
  # PATCH/PUT /question_attachments/1
  def update
    if @question_attachment.update(question_attachment_params)
      render json: @question_attachment
    else
      render json: @question_attachment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /question_attachments/1
  def destroy
    @question_attachment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_attachment
      @question_attachment = QuestionAttachment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_attachment_params
      #params.fetch(:question_attachment, {})
      params.require(:question_attachment).permit(:question_id, :attachment)
    end
end
