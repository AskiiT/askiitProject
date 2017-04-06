class API::V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]
  
  def translate(s)
    s=s.upcase
    if s=='NEWEST'
      s=1
    elsif s=='OLDEST'
      s=2
    elsif s=='HARDEST'
      s=3
    elsif s=='EASIEST'
      s=4
    end
  end

  # GET /questions
  def index
    #@questions = Question.all
    p = params[:page]
    s = params[:sort]
    if s.nil?
      s = 1
    else
      s = translate(s)
    end

    @questions = Question.sort_by(Question.all, s)
    unless p.nil? 
      @questions = Question.load_questions( sort = s, page = p )
    end

    if @questions.empty?
      render json: 
        { data:
          {
            error: "No more questions to show."
          }
        }
    else
      render json: @questions
    end
  end

  # GET /questions/1
  def show
    render json: @question
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created #, location: @question
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
    s= params[:sort]
    if s.nil?
      s=1
    else
      s=translate(s)
    end

    @question = Question.questions_by_title(title=params[:title], sort=s).page(params[:page])
    render json: @question
  end

  def by_tag
    g = params[:tag]
    page = params[:page]
    m = g.to_i
    if m.to_s != g.to_s
      u=Tag.tag_id_name(params[:tag])
      g=u.to_i
    end

    s= params[:sort]
    if s.nil?
      s=1
    else
      s=translate(s)
    end


    @questions = Question.questions_by_tag(tag=g, sort=s).page(page)

    render json: @questions
  end

  def by_topic
    g=params[:topic]
    m=g.to_i
    
    if m.to_s != g.to_s
      u=Topic.topic_id_name(params[:topic])
      g=u.to_i
    end

    s= params[:sort]
    if s.nil?
      s=1
    else
      s=translate(s)
    end


    @questions = Question.questions_by_topic(topic=g, sort=s).page(params[:page])
    render json: @questions
  end


  def my_questions
    s= params[:sort]
    if s.nil?
      s=1
    else
      s=translate(s)
    end

    @question_list = Question.questions_by_user(user=params[:user_id], sort=s).page(params[:page])
    render json: @question_list
  end


  def is_postulated_to
    s= params[:sort]
    if s.nil?
      s=1
    else
      s=translate(s)
    end
    @postulate= Question.question_postulated(user=params[:user_id], sort=s).page(params[:page])
    render json: @postulate
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
