class QuestionAttachmentsController < ApplicationController
  before_action :set_question_attachment, only: [:show, :update, :destroy]

  # GET /question_attachments
  def index
    @question_attachments = QuestionAttachment.all

    render json: @question_attachments
  end

  # GET /question_attachments/1
  def show
    render json: @question_attachment
  end

  # POST /question_attachments
  def create
    @question_attachment = QuestionAttachment.new(question_attachment_params)

    if @question_attachment.save
      render json: @question_attachment, status: :created, location: @question_attachment
    else
      render json: @question_attachment.errors, status: :unprocessable_entity
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
      params.fetch(:question_attachment, {})
    end
end
