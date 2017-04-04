class API::V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]

  # GET /questions
  def index
    @questions = Question.all
    f= params[:page]
    unless f.nil?
      @questions = Question.load_questions.page(f)
    end
    render json: @questions
  end

  # GET /questions/1
  def show
    render json: @question
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end

  def questions_by_title
    @question = Question.questions_by_title(params[:title]).page(params[:page])
    render json: @question
  end

  def by_tag
    @questions = Question.questions_by_tag(params[:tag]).page(params[:page])
    render json: @questions
  end

  def by_topic
    @questions = Question.questions_by_topic(params[:topic]).page(params[:page])
    render json: @questions
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:title, :body, :date_posted, :difficulty, :user_id, :topic_id)
    end
end
