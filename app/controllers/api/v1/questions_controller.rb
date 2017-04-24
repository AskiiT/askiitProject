class API::V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]
  #before_action :authenticate_user!, only:[:create, :destroy, :update]

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

    @questions = Question.load_questions( sort = s, page = p )


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
    #@question.user_id= current_user.id
    g=params[:topic]
    if g.nil?
      render json: {data: {error: "Topic no puede estar vacio"}}
    else
      m=g.to_i
      
      if m.to_s != g.to_s
        u=Topic.topic_id_name(params[:topic])
        g=u.to_i
      end
      @question.topic_id=g

      if @question.save
        render json: @question, status: :created
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /questions/1
  # def update
  #   if @question.user_id == current_user.id
  #     if @question.update(question_params)
  #       render json: @question
  #     else
  #       render json: @question.errors, status: :unprocessable_entity
  #     end
  #   else
  #     render json: 
  #       { data:
  #         {
  #           error: "Usted no puede editar esta pregunta."
  #         }
  #       }
  #   end  
  # end

  # DELETE /questions/1
  # def destroy
  #   if @question.user_id==current_user.id
  #     @question.destroy
  #   else
  #     render json: 
  #       { data:
  #         {
  #           error: "Usted no puede eliminar esta pregunta."
  #         }
  #       }
  #     end
  # end

  def destroy
    @question.destroy
  end
  
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end 
  end
  ###############################
  ###Custom methods
  ###############################

  def questions_by_title
    s= params[:sort]
    if s.nil?
      s=1
    else
      s=translate(s)
    end

    @questions = Question.questions_by_title(title=params[:title], sort=s).page(params[:page])
    
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

  def by_tag
    g = params[:tag]
    g1 = params[:second_tag]
    g2 = params[:third_tag]
    idds=[]
    ps = params[:page]
    if ps.nil?
      ps=1
    end
    m = g.to_i
    if m.to_s != g.to_s
      u=Tag.tag_id_name(params[:tag])
      g=u.to_i
    end

    
    if g1.nil?
      s= params[:sort]
      if s.nil?
        s=1
      else
        s=translate(s)
      end
      @questions = Question.questions_by_tag(tag=g, sort=s).page(ps)
    else
      idds.append(g)
      m = g1.to_i
      if m.to_s != g1.to_s
        u=Tag.tag_id_name(g1)
        g1=u.to_i
      end
      idds.append(g1)
      if g2.nil?
        g2=-1
      else
        m = g2.to_i
        if m.to_s != g2.to_s
          u=Tag.tag_id_name(g2)
          g2=u.to_i
        end
      end
      idds.append(g2)
      @questions=Question.questions_by_manytags(ids=idds, sort=s, page=ps)
    end
    

    if @questions.nil?
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


  def my_questions
    s= params[:sort]
    if s.nil?
      s=1
    else
      s=translate(s)
    end

    @question_list = Question.questions_by_user(user=params[:user_id], sort=s).page(params[:page])

    if @question_list.empty?
      render json: 
        { data:
          {
            error: "No more questions to show."
          }
        }
      else
        render json: @question_list
      end
  end


  def is_postulated_to
    s= params[:sort]
    if s.nil?
      s=1
    else
      s=translate(s)
    end
    @postulate= Question.question_postulated(user=params[:user_id], sort=s).page(params[:page])

    if @postulate.empty?
      render json: 
        { data:
          {
            error: "No more questions to show."
          }
        }
    else
      render json: @postulate
    end
  end


  def has_postulated
    s= params[:sort]
    if s.nil?
      s=1
    else
      s=translate(s)
    end
    @question=Question.postulated_question(sort=s).page(params[:page])
    if @question.empty?
      render json: 
        { data:
          {
            error: "No more questions to show."
          }
        }
    else
      render json: @question
    end
  end

  def has_not_postulated
    s= params[:sort]
    if s.nil?
      s=1
    else
      s=translate(s)
    end
    @question=Question.not_postulated_question(sort=s).page(params[:page])
    if @question.empty?
      render json: 
        { data:
          {
            error: "No more questions to show."
          }
        }
    else
      render json: @question
    end
  end

  ######
  ##Other functions
  ######

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:title, :body, :date_posted, :difficulty, :user_id)
    end
end
