class Question < ApplicationRecord

  scope :order_newest, -> { order("questions.date_posted DESC") }
  scope :order_oldest, -> { order("questions.date_posted ASC") }
  scope :order_harder, -> { order("questions.difficulty DESC") }
  scope :order_easiest, -> { order("questions.difficulty ASC") }
  scope :first_topics, -> { order("questions.topic_id DESC") }
  scope :last_topics, -> { order("questions.topic_id ASC") }
  scope :firsts_users, -> { order("questions.user_id DESC") }
  scope :last_users, -> { order("questions.user_id ASC") }
  scope :order_body, -> { order("questions.body DESC") }
  scope :order_asc_body, -> { order("questions.body ASC") }
  scope :order_title, -> { order("questions.title DESC") }
  scope :order_asc_title, -> { order("questions.title ASC") }
  scope :order_id, -> { order("questions.id DESC") }
  scope :order_asc_id, -> { order("questions.id ASC") }

  belongs_to :user
  belongs_to :topic
  has_many :question_attachments
  has_many :tags, through: :question_has_tags
  has_many :question_has_tags
  has_many :p_users, through: :postulates, source: :user
  has_many :postulates

  validates :title, :difficulty, :date_posted, presence: true
  validates :title, length: { in: 12..140 }
  validates_inclusion_of :difficulty, in: 1..10
  validates :body, length: {maximum: 500}, allow_blank: true
  validate  :actual_date

  def actual_date
      if date_posted.present? && date_posted > DateTime.now
        errors.add(:date_posted, "can't be post in the future" )
      end
  end

  def self.sort_by(query1, sort)
    case sort
    when 1
      query1= query1.order_newest
    when 2
      query1= query1.order_oldest
    when 3
      query1= query1.order_harder
    when 4
      query1= query1.order_easiest
    when 5
      query1= query1.first_topics
    when 6
      query1= query1.last_topics
    when 7
      query1= query1.firsts_users
    when 8
      query1= query1.last_users
    when 9
      query1= query1.order_body
    when 10
      query1= query1.order_asc_body
    when 11
      query1= query1.order_title
    when 12
      query1= query1.order_asc_title
    when 13
      query1= query1.order_id
    when 14
      query1= query1.order_asc_id
    end
    query1
  end
  def self.parameters
    parameters=['id', 'title', 'body', 'user_id', 'topic_id', 'difficulty','date_posted']
    parameters
  end

  def self.load_questions(args=[], sort= [1], page = 1, per_page = 20)
    #por=args & Question.parameters
    if args.size>0 
      g= Question.all.select(args)
    else
      g= Question.all
    end
    for i in 0...sort.size do
      g=Question.sort_by(g, sort[i])
    end
    
    g.paginate(:page => page,:per_page => per_page)
  end


  def self.show_question(id, args)
    Question.where("questions.id = ?", id).select(args).first
  end
  #Retorna una pregunta por id
  def self.question_by_id(id)
    includes(:topic, :question_attachments, question_has_tags:[:tag], user: [:rank, :domain_ranks])
    .find_by_id(id)
  end

  #Retorna una pregunta por id
  def self.questions_by_ids(ids, sort=1, page = 1, per_page = 20)
    g=load_questions(sort, page, per_page).where( questions:{id: ids} )
    g.paginate(:page => page,:per_page => per_page)
  end

  #Busca coincidencias del titulo de una pregunta
  def self.questions_by_title(title, sort=1, page = 1, per_page = 20)
    g=where("questions.title LIKE ?", "%#{title.downcase}%")
    g=Question.sort_by(g, sort)
    g.paginate(:page => page,:per_page => per_page)
  end

  #Consulta las preguntas hechas por un usuario
  def self.questions_by_user(user, args=[], sort=[1], page = 1, per_page = 20)
    if (args.size>0)
      g=Question.where(questions:{user_id: user}).select(args)
    else
      g=Question.where(questions:{user_id: user})
    end
    for i in 0...sort.size do
      g=Question.sort_by(g, sort[i])
    end
    g.paginate(:page => page,:per_page => per_page)
  end

  #Consulta que preguntas tienen o han tenido postulaciones
  def self.postulated_question( args=[], sort=[1], page = 1, per_page = 20)
      if (args.size>0)
        g=joins(:postulates).select(args).distinct
      else
        g=joins(:postulates).distinct
      end
      for i in 0...sort.size do
        g=Question.sort_by(g, sort[i])
      end
      g.paginate(:page => page,:per_page => per_page)
  end

  #Consulta que preguntas NO tienen o NUNCA han tenido postulaciones
  def self.not_postulated_question(args=[], sort=[1], page = 1, per_page = 20)
    r=joins(:postulates)
    if(args.size>0)
      g=where.not('id IN (?)', r.select('id')).select(args)
    else
      g=where.not('id IN (?)', r.select('id'))
    end
    for i in 0...sort.size do
      g=Question.sort_by(g, sort[i])
    end
    g.paginate(:page => page,:per_page => per_page)
  end

  #Me retorna preguntas en un tag
  def self.questions_by_tag(tag, args=[], sort=[1], page = 1, per_page = 20)
    g=QuestionHasTag.where('tag_id = ?', tag).select("question_id").group("question_id")
    if (args.size>0)
      g=where('questions.id in (?)', g).select(args)
    else
      g=where('questions.id in (?)', g)
    end
    for i in 0...sort.size do
      g=Question.sort_by(g, sort[i])
    end
    g.paginate(:page => page,:per_page => per_page)
  end

  #Ver los adjuntos que tiene la pregunta
  def self.all_attachments(id, page = 1, per_page = 20)
    QuestionAttachment.get_attachments( id, page, per_page )
  end
  
  #Ordena preguntas por dificultad
  def self.sort_by_difficulty(topic, page = 1, per_page = 20)
    joins(:topic).where("topic_id= ?", topic).order("questions.difficulty DESC")
    .select("questions.id, questions.title, questions.difficulty")
    .paginate(:page => page,:per_page => per_page)
  end


  #Retorna preguntas por tema
  def self.questions_by_topic(topic, args=[], sort=[1], page = 1, per_page = 20)
    if args.size>0
      g=where("topic_id= ?", topic).select(args)
    else
      g=where("topic_id= ?", topic)
    end
    for i in 0...sort.size do
      g=Question.sort_by(g, sort[i])
    end
    g.paginate(:page => page,:per_page => per_page)
  end

  def self.sort_by_date( page = 1, per_page = 20)
    load_questions(page, per_page).order("questions.date_posted ASC")
  end

  def self.how_many_post(id)
    joins(:postulates).where("postulates.question_id=?",id).size
    #m=g.size
    #where("questions.id=?", id).select("questions.id, questions.title", g)
  end

  def self.question_postulated(user, args=[], sort=[1], page = 1, per_page = 20)
    if args.size>0
      g=joins(:postulates).where("postulates.user_id=?", user).select(args)
    else
      g=joins(:postulates).where("postulates.user_id=?", user)
    end
    for i in 0...sort.size do
      g=Question.sort_by(g, sort[i])
    end
    g.paginate(:page => page,:per_page => per_page)
  end
  

  def self.questions_by_manytags(ids, topics, page = 1, per_page = 20)
    i=ids.length
    m=[];
    g=[];

    for j in 0...i do  
      r=ids[j]
      r=r.to_i
      unless r<0
        m.append(r)
        g.append(QuestionHasTag.where('tag_id = ?', r))
      end
    end
    
    Question.questions_by_tags(m, topics, g, page, per_page)
  end

  def self.questions_by_tags(tags, topics, queries, sort=1, page = 1, per_page = 20)
    ids=[]
    i=tags.length
    for j in 0...i do
      h=queries[j].size
      tmpArr=[]
      for k in 0...h do
        if j>0
          id=queries[j].limit(1).offset(k).first.question_id;
          tmpArr.append(id)
        else
          ids.append(queries[j].limit(1).offset(k).first.question_id)
          tmpArr=ids
        end
      end
      ids=tmpArr & ids
    end

    siz=ids.length
    
    if siz==1
      gu=Question.where(id: ids[0])
      if topics.length>0
        gu.where(questions: {topic_id: topics})
      else
        gu
      end
    elsif siz==0
      Question.find_by_id(-1)
    else
      samba=Question.where( questions: {id: ids})
      if topics.length>0
        samba=samba.where(questions: {topic_id: topics})
      end

      if samba.empty?
        samba
      elsif samba.nil?
        samba
      elsif samba.size == 1
        samba
      else

        samba=Question.sort_by(samba, sort)
        puts samba.size
        samba.paginate(:page => page,:per_page => per_page)
      end
    end
    #Question.find_by_id(80)
  end

end
