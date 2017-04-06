class Question < ApplicationRecord

  scope :order_newest, -> { order("questions.date_posted DESC") }
  scope :order_oldest, -> { order("questions.date_posted ASC") }
  scope :order_harder, -> { order("questions.difficulty DESC") }
  scope :order_easiest, -> { order("questions.difficulty ASC") }

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
      if date_posted.present? && date_posted > Date.today
        errors.add(:date_posted, "can't be post in the future" )
      end
  end

  def self.sort_by(query1, sort)
    if sort==1
      query1= query1.order_newest
    elsif sort==2
      query1= query1.order_oldest
    elsif sort==3
      query1= query1.order_harder
    elsif sort==4
      query1= query1.order_easiest
    end
  end

  def self.load_questions(sort= 1, page = 1, per_page = 10)
    g= Question.includes(:p_users, :topic, :question_attachments, question_has_tags: [:tag], user: [:rank, :domain_ranks, :p_questions])
    g=Question.sort_by(g, sort)
    g.select("questions.id", "questions.date_posted", "questions.difficulty").paginate(:page => page,:per_page => per_page)
  end

  #Retorna una pregunta por id
  def self.question_by_id(id)
    includes(:topic, :question_attachments, question_has_tags:[:tag], user: [:rank, :domain_ranks])
    .find_by_id(id)
  end

  #Retorna una pregunta por id
  def self.questions_by_ids(ids, sort=1, page = 1, per_page = 10)
    g=load_questions(sort, page, per_page).where( questions:{id: ids} )
    g.paginate(:page => page,:per_page => per_page)
  end

  #Busca coincidencias del titulo de una pregunta
  def self.questions_by_title(title, sort=1, page = 1, per_page = 10)
    g=where("questions.title LIKE ?", "%#{title.downcase}%")
    g=Question.sort_by(g, sort)
    g.paginate(:page => page,:per_page => per_page)
  end

  #Consulta las preguntas hechas por un usuario
  def self.questions_by_user(user, sort=1, page = 1, per_page = 10)
    load_questions(sort, page, per_page)
    .where(questions:{user_id: user})
    .paginate(:page => page,:per_page => per_page)
  end

  #Consulta que preguntas tienen o han tenido postulaciones
  def self.postulated_question(sort=1, page = 1, per_page = 10)
      g=joins(:postulates).select("questions.id").group("questions.id")
      g=Question.sort_by(g, sort)
      g.paginate(:page => page,:per_page => per_page)
  end

  #Consulta que preguntas NO tienen o NUNCA han tenido postulaciones
  def self.not_postulated_question(sort=1, page = 1, per_page = 10)
    g=where.not('id IN (?)', postulated_question)
    g=Question.sort_by(g, sort)
    g.paginate(:page => page,:per_page => per_page)
  end

  #Me retorna preguntas en un tag
  def self.questions_by_tag(tag, sort=1, page = 1, per_page = 10)
    g=QuestionHasTag.where('tag_id = ?', tag).select("question_id").group("question_id")
    m=where('questions.id in (?)', g)
    g=Question.sort_by(m, sort)
    g.paginate(:page => page,:per_page => per_page)
  end

  #Ver los adjuntos que tiene la pregunta
  def self.all_attachments(id, page = 1, per_page = 10)
    QuestionAttachment.get_attachments( id, page, per_page )
  end
  
  #Ordena preguntas por dificultad
  def self.sort_by_difficulty(topic, page = 1, per_page = 10)
    joins(:topic).where("topic_id= ?", topic).order("questions.difficulty DESC")
    .select("questions.id, questions.title, questions.difficulty")
    .paginate(:page => page,:per_page => per_page)
  end


  #Retorna preguntas por tema
  def self.questions_by_topic(topic, sort=1, page = 1, per_page = 10)
    g=joins(:topic).where("topic_id= ?", topic)
    g=Question.sort_by(g, sort)
    g.paginate(:page => page,:per_page => per_page)
  end

  def self.sort_by_date( page = 1, per_page = 10)
    load_questions(page, per_page).order("questions.date_posted ASC")
  end

  def self.how_many_post(id)
    joins(:postulates).where("postulates.question_id=?",id).size
    #m=g.size
    #where("questions.id=?", id).select("questions.id, questions.title", g)
  end

  def self.question_postulated(user, sort=1, page = 1, per_page = 10)
    g=joins(:postulates).where("postulates.user_id=?", user)
    g=Question.sort_by(g, sort)
    g.paginate(:page => page,:per_page => per_page)
  end


end
