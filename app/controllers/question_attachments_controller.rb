class QuestionAttachmentsController < ApplicationController
  before_action :set_question_attachment, only: [:show, :edit, :update, :destroy]

  # GET /question_attachments
  # GET /question_attachments.json
  def index
    @question_attachments = QuestionAttachment.all
  end

  # GET /question_attachments/1
  # GET /question_attachments/1.json
  def show
  end

  # GET /question_attachments/new
  def new
    @question_attachment = QuestionAttachment.new
  end

  # GET /question_attachments/1/edit
  def edit
  end

  # POST /question_attachments
  # POST /question_attachments.json
  def create
    @question_attachment = QuestionAttachment.new(question_attachment_params)

    respond_to do |format|
      if @question_attachment.save
        format.html { redirect_to @question_attachment, notice: 'Question attachment was successfully created.' }
        format.json { render :show, status: :created, location: @question_attachment }
      else
        format.html { render :new }
        format.json { render json: @question_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_attachments/1
  # PATCH/PUT /question_attachments/1.json
  def update
    respond_to do |format|
      if @question_attachment.update(question_attachment_params)
        format.html { redirect_to @question_attachment, notice: 'Question attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_attachment }
      else
        format.html { render :edit }
        format.json { render json: @question_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_attachments/1
  # DELETE /question_attachments/1.json
  def destroy
    @question_attachment.destroy
    respond_to do |format|
      format.html { redirect_to question_attachments_url, notice: 'Question attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_attachment
      @question_attachment = QuestionAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_attachment_params
      params.require(:question_attachment).permit(:question_attachment, :archive_type, :question_id)
    end
end
