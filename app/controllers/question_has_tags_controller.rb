class QuestionHasTagsController < ApplicationController
  before_action :set_question_has_tag, only: [:show, :update, :destroy]

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
    @question_has_tag = QuestionHasTag.new(question_has_tag_params)

    if @question_has_tag.save
      render json: @question_has_tag, status: :created, location: @question_has_tag
    else
      render json: @question_has_tag.errors, status: :unprocessable_entity
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
    @question_has_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_has_tag
      @question_has_tag = QuestionHasTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_has_tag_params
      params.require(:question_attachment).permit(:question_id, :attachment)
    end
end
