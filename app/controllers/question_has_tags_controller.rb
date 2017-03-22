class QuestionHasTagsController < ApplicationController
  before_action :set_question_has_tag, only: [:show, :edit, :update, :destroy]

  # GET /question_has_tags
  # GET /question_has_tags.json
  def index
    @question_has_tags = QuestionHasTag.all
  end

  # GET /question_has_tags/1
  # GET /question_has_tags/1.json
  def show
  end

  # GET /question_has_tags/new
  def new
    @question_has_tag = QuestionHasTag.new
  end

  # GET /question_has_tags/1/edit
  def edit
  end

  # POST /question_has_tags
  # POST /question_has_tags.json
  def create
    @question_has_tag = QuestionHasTag.new(question_has_tag_params)

    respond_to do |format|
      if @question_has_tag.save
        format.html { redirect_to @question_has_tag, notice: 'Question has tag was successfully created.' }
        format.json { render :show, status: :created, location: @question_has_tag }
      else
        format.html { render :new }
        format.json { render json: @question_has_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_has_tags/1
  # PATCH/PUT /question_has_tags/1.json
  def update
    respond_to do |format|
      if @question_has_tag.update(question_has_tag_params)
        format.html { redirect_to @question_has_tag, notice: 'Question has tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_has_tag }
      else
        format.html { render :edit }
        format.json { render json: @question_has_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_has_tags/1
  # DELETE /question_has_tags/1.json
  def destroy
    @question_has_tag.destroy
    respond_to do |format|
      format.html { redirect_to question_has_tags_url, notice: 'Question has tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_has_tag
      @question_has_tag = QuestionHasTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_has_tag_params
      params.require(:question_has_tag).permit(:question_id, :tag_id)
    end
end
