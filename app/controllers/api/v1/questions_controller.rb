class API::V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:update, :destroy]
  before_action :authenticate_user!, only:[:create, :destroy, :update]

  def getCols(arr)
    parameters=['id', 'title', 'body', 'user_id', 'topic_id', 'difficulty','date_posted']
    por = arr & parameters
    return por
  end

  def includes(arr)
    parameters=['user']
    por = arr & parameters
    ins=[]
    unless por.nil?
      ins.append([user: [:rank, :domain_ranks, :questions, :avatar]])
    end
    ins
  end
  def translate(s)
    s=s.upcase
    case s
    when '-DATE'
      s=1
    when 'DATE'
      s=2
    when'-DIFFICULTY'
      s=3
    when 'DIFFICULTY'
      s=4
    when '-TOPIC'
      s=5
    when 'TOPIC'
      s=6
    when '-USER'
      s=7
    when 'USER'
      s=8
    when '-BODY'
      s=9
    when 'BODY'
      s=10
    when '-TITLE'
      s=11
    when 'TITLE'
      s=12
    when '-ID'
      s=13
    when 'ID'
      s=14
    else
      s=1
    end
  end

  # GET /questions
  def index
    #@questions = Question.all
    p = params[:page]
    s = params[:sort]
    el=params[:select_questions]
    arr=[]
    unless el.nil?
      el=el.split(",")
      arr=el.map(&:downcase)
      arr=getCols(arr)
    end
    q=params[:q]
    if q.nil?
      q=""
    end

    if s.nil?
      s = [1]
    else
      sortar=[]
      s=s.split(",")
      s.each do |i|
        sortar.push(translate(i))
      end
      s=sortar
    end
 

    @questions = Question.load_questions( arr, q, sort = s, page = p )

    ins=params[:includes]
    if ins.nil?
      ins = []
    else
      sortar=[]
      ins=ins.split(",")
      ins=includes(ins)
    end

    if @questions.empty?
      render json: 
        { data:
          {
            error: "No more questions to show."
          }
        }
    else
      ins=params[:includes]
      if ins.nil?
        ins = []
      else
        sortar=[]
        ins=ins.split(",")
        ins=includes(ins)
      end
      if ins.size<=0
        if arr.size>0
          if params[:nom].nil?
            render json: @questions, each_serializer: QuestionCustomSerializer, scope: arr
          else
            render json: @questions, each_serializer: QuestionCustomNoRelSerializer, scope: arr
          end
        else
          render json: @questions
        end
      else
        if arr.size>0
          render json: @questions, each_serializer: QuestionCustomSerializer, scope: arr, include: ins
        else
          render json: @questions, include: ins
        end
      end
    end
  end

  # GET /questions/1
  def show
    el=params[:select_questions]
    arr=[]
    unless el.nil?
      el=el.split(",")
      arr=el.map(&:downcase)
      arr=getCols(arr)
    end

    if arr.size>0
      @question=Question.show_question(params[:id], arr)
    else
      @question=Question.find(params[:id])
    end
    ins=params[:includes]
    if ins.nil?
      ins = []
    else
      sortar=[]
      ins=ins.split(",")
      ins=includes(ins)
    end
    if ins.size<=0
      if arr.size>0
        if params[:nom].nil?
          render json: @question, serializer: QuestionCustomSerializer, scope: arr
        else
          render json: @question, serializer: QuestionCustomNoRelSerializer, scope: arr
        end
      else
        render json: @question
      end
    else
      if arr.size>0
        render json: @question, serializer: QuestionCustomSerializer, scope: arr, include: ins
      else
        render json: @question, include: ins
      end
    end
   
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    @question.user_id= current_user.id
    #@question.user_id = params[:user_id]
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
        time=params[:time]
        @question.end_time= @question.date_posted + time.to_i.minutes
        @question.save
        question_id=@question.id
        tags=params[:tags]
        valid=true
        unless tags.nil?
          siz=tags.size
          if siz>3
            siz=3
          end
          for j in 0...siz do
            @question_has_tag = QuestionHasTag.new
            tag_id=tags[j]
            name=tag_id
            ta_id=Tag.tag_id_name(name)

            if ta_id<0
              QuestionHasTag.tag_created(name)
              ta_id=Tag.tag_id_name(name)
            end
            @question_has_tag.tag_id=ta_id
            @question_has_tag.question_id=question_id
            @question_has_tag.save
          end
        end

        render json: @question, status: :created 


      else
        render json: @question.errors, status: :unprocessable_entity
      end
    end
  end

 # PATCH/PUT /questions/1
  def update
    if @question.user_id == current_user.id
      if @question.update(question_params)
        render json: @question
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    else
      render json: 
        { data:
          {
            error: "Usted no puede editar esta pregunta."
          }
        }
    end  
  end

 # DELETE /questions/1
  def destroy
    if @question.user_id==current_user.id
      @question.destroy
    else
      render json: 
        { data:
          {
            error: "Usted no puede eliminar esta pregunta."
          }
        }
      end
  end

  ###########################
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

    idds=[]
    g=g.split(",")
    q=params[:q]
    if q.nil?
      q=""
    end
    ps = params[:page]
    if ps.nil?
      ps=1
    end
    size=g.size;
    if size==1
      k= g[0]
      m = k.to_i
      if m.to_s != k.to_s
        u=Tag.tag_id_name(k)
        k=u.to_i
      end


      s=params[:sort]
      if s.nil?
        s = [1]
      else
        sortar=[]
        s=s.split(",")
          for j in 0...s.size do
            sortar.push(translate(s[j]))
          end
        s=sortar
      end

      arr=[]
      el=params[:select_questions]
      unless el.nil?
        el=el.split(",")
        arr=el.map(&:downcase)
        arr=getCols(arr)
      end
      if arr.size>0
        @questions = Question.questions_by_tag(tag=k, q, arg=arr, sort=s).page(ps)
      else
        @questions = Question.questions_by_tag(tag=k, q, arg=[], sort=s).page(ps)
      end

    else
      idds=[]
      top=[]
      arr=[]
      for j in 0...size
        k=g[j]
        m = k.to_i
        uff=0;
        titl=g[j].to_s
        if titl.size>3
          tre=titl[0,3]
          if tre=="to_"
            m=Topic.topic_id_name(titl[3,titl.size])
            unless m<1
              top.push(m)
            end
          end
        end

        if m.to_s != k.to_s
          u=Tag.tag_id_name(k)
          uff=u.to_i
        end
        if uff>0
          idds.append(uff)
        end

      end

      @questions=Question.questions_by_manytags(ids=idds, topics=top, sort=s, page=ps)
    end

    if @questions.nil?
      render json: 
        { data:
          {
            error: "No more questions to show."
          }
        }
    elsif @questions.empty?
      render json: 
        { data:
          {
            error: "No more questions to show."
          }
        }
    else
      ins=params[:includes]
      if ins.nil?
        ins = []
      else
        sortar=[]
        ins=ins.split(",")
        ins=includes(ins)
      end
      if ins.size<=0
        if arr.size>0
          if params[:nom].nil?
            render json: @questions, each_serializer: QuestionCustomSerializer, scope: arr
          else
            render json: @questions, each_serializer: QuestionCustomNoRelSerializer, scope: arr
          end
        else
          render json: @questions
        end
      else
        if arr.size>0
          render json: @questions, each_serializer: QuestionCustomSerializer, scope: arr, include: ins
        else
          render json: @questions, include: ins
        end
      end
    end
  end









  def by_topic
    g=params[:topic]
    m=g.to_i
    
    q=params[:q]
    if q.nil?
      q=""
    end

    if m.to_s != g.to_s
      u=Topic.topic_id_name(params[:topic])
      g=u.to_i
    end

    s=params[:sort]
    if s.nil?
      s = [1]
    else
      sortar=[]
      s=s.split(",")
        for j in 0...s.size do
          sortar.push(translate(s[j]))
        end
      s=sortar
    end

    arr=[]
    el=params[:select_questions]
    unless el.nil?
      el=el.split(",")
      arr=el.map(&:downcase)
      arr=getCols(arr)
    end
    if arr.size>0
      @questions = Question.questions_by_topic(topic=g, q, arg=arr, sort=s).page(params[:page])
    else
      @questions = Question.questions_by_topic(topic=g, q, arg=[], sort=s).page(params[:page])
    end
    

    if @questions.empty?
      render json: 
        { data:
          {
            error: "No more questions to show."
          }
        }
    else
      ins=params[:includes]
      if ins.nil?
        ins = []
      else
        sortar=[]
        ins=ins.split(",")
        ins=includes(ins)
      end
      if ins.size<=0
        if arr.size>0
          if params[:nom].nil?
            render json: @questions, each_serializer: QuestionCustomSerializer, scope: arr
          else
            render json: @questions, each_serializer: QuestionCustomNoRelSerializer, scope: arr
          end
        else
          render json: @questions
        end
      else
        if arr.size>0
          render json: @questions, each_serializer: QuestionCustomSerializer, scope: arr, include: ins
        else
          render json: @questions, include: ins
        end
      end
    end
  end


  def my_questions
    q=params[:q]
    if q.nil?
      q=""
    end
    
    s=params[:sort]
    if s.nil?
      s = [1]
    else
      sortar=[]
      s=s.split(",")
        for j in 0...s.size do
          sortar.push(translate(s[j]))
        end
      s=sortar
    end


    arr=[]
    el=params[:select_questions]
    unless el.nil?
      el=el.split(",")
      arr=el.map(&:downcase)
      arr=getCols(arr)
    end

    if arr.size>0
      @questions = Question.questions_by_user(user=params[:user_id], q, args=arr, sort=s).page(params[:page])
    else
      @questions = Question.questions_by_user(user=params[:user_id], q, args=[], sort=s).page(params[:page])
    end

    if @questions.empty?
      render json: 
        { data:
          {
            error: "No more questions to show."
          }
        }
      else
        ins=params[:includes]
        if ins.nil?
          ins = []
        else
          sortar=[]
          ins=ins.split(",")
          ins=includes(ins)
        end
        if ins.size<=0
          if arr.size>0
            if params[:nom].nil?
              render json: @questions, each_serializer: QuestionCustomSerializer, scope: arr
            else
              render json: @questions, each_serializer: QuestionCustomNoRelSerializer, scope: arr
            end
          else
            render json: @questions
          end
        else
          if arr.size>0
            render json: @questions, each_serializer: QuestionCustomSerializer, scope: arr, include: ins
          else
            render json: @questions, include: ins
          end
        end
      end
  end


  def is_postulated_to
    s=params[:sort]
    if s.nil?
      s = [1]
    else
      sortar=[]
      s=s.split(",")
        for j in 0...s.size do
          sortar.push(translate(s[j]))
        end
      s=sortar
    end

    q=params[:q]
    if q.nil?
      q=""
    end

    arr=[]
    el=params[:select_questions]
    unless el.nil?
      el=el.split(",")
      arr=el.map(&:downcase)
      arr=getCols(arr)
    end

    if arr.size>0
      @questions= Question.question_postulated(user=params[:user_id], q, args=arr, sort=s).page(params[:page])
    else
      @questions= Question.question_postulated(user=params[:user_id], q, args=[], sort=s).page(params[:page])
    end

    if @questions.empty?
      render json: 
        { data:
          {
            error: "No more questions to show."
          }
        }
    else
      ins=params[:includes]
      if ins.nil?
        ins = []
      else
        sortar=[]
        ins=ins.split(",")
        ins=includes(ins)
      end
      if ins.size<=0
        if arr.size>0
          if params[:nom].nil?
            render json: @questions, each_serializer: QuestionCustomSerializer, scope: arr
          else
            render json: @questions, each_serializer: QuestionCustomNoRelSerializer, scope: arr
          end
        else
          render json: @questions
        end
      else
        if arr.size>0
          render json: @questions, each_serializer: QuestionCustomSerializer, scope: arr, include: ins
        else
          render json: @questions, include: ins
        end
      end
    end
  end


  def has_postulated
    s=params[:sort]
    if s.nil?
      s = [1]
    else
      sortar=[]
      s=s.split(",")
        for j in 0...s.size do
          sortar.push(translate(s[j]))
        end
      s=sortar
    end

    q=params[:q]
    if q.nil?
      q=""
    end

    arr=[]
    el=params[:select_questions]
    unless el.nil?
      el=el.split(",")
      arr=el.map(&:downcase)
      arr=getCols(arr)
    end

    if arr.size>0
      @question=Question.postulated_question(q, args=arr, sort=s).page(params[:page])
    else
      @question=Question.postulated_question(q, args=[], sort=s).page(params[:page])
    end


    if @question.empty?
      render json: 
        { data:
          {
            error: "No more questions to show."
          }
        }
    else
      if arr.size>0
        if params[:nom].nil?
          render json: @question, each_serializer: QuestionCustomSerializer, scope: arr
        else
          render json: @question, each_serializer: QuestionCustomNoRelSerializer, scope: arr
        end
      else
        ins=params[:includes]
        if ins.nil?
          ins = []
        else
          sortar=[]
          ins=ins.split(",")
          ins=includes(ins)
        end
        if ins.size<=0
          if arr.size>0
            if params[:nom].nil?
              render json: @question, each_serializer: QuestionCustomSerializer, scope: arr
            else
              render json: @question, each_serializer: QuestionCustomNoRelSerializer, scope: arr
            end
          else
            render json: @question
          end
        else
          if arr.size>0
            render json: @question, each_serializer: QuestionCustomSerializer, scope: arr, include: ins
          else
            render json: @question, include: ins
          end
        end
      end
    end
  end

  def has_not_postulated
    s=params[:sort]
    if s.nil?
      s = [1]
    else
      sortar=[]
      s=s.split(",")
        for j in 0...s.size do
          sortar.push(translate(s[j]))
        end
      s=sortar
    end
    q=params[:q]
    if q.nil?
      q=""
    end

    arr=[]
    el=params[:select_questions]
    unless el.nil?
      el=el.split(",")
      arr=el.map(&:downcase)
      arr=getCols(arr)
    end

    if arr.size>0
      @question=Question.not_postulated_question(q, args=arr, sort=s).page(params[:page])
    else
      @question=Question.not_postulated_question(q, args=[], sort=s).page(params[:page])
    end

    q=params[:q]
    unless q.nil?
      @question=@question.where("lower(questions.title) LIKE ?", "%#{q.downcase}%")
    end
    
    if @question.empty?
      render json: 
        { data:
          {
            error: "No more questions to show."
          }
        }
    else
      ins=params[:includes]
      if ins.nil?
        ins = []
      else
        sortar=[]
        ins=ins.split(",")
        ins=includes(ins)
      end
      if ins.size<=0
        if arr.size>0
          if params[:nom].nil?
            render json: @question, each_serializer: QuestionCustomSerializer, scope: arr
          else
            render json: @question, each_serializer: QuestionCustomNoRelSerializer, scope: arr
          end
        else
          render json: @question
        end
      else
        if arr.size>0
          render json: @question, each_serializer: QuestionCustomSerializer, scope: arr, include: ins
        else
          render json: @question, include: ins
        end
      end
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
      params.require(:question).permit(:title, :body, :difficulty, :user_id)
    end
end
