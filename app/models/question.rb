class Question < ApplicationRecord

  scope :order_by_date_posted, -> { order("questions.date_posted DESC") }
  scope :order_by_difficulty, -> { order("questions.difficulty DESC") }

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

  def self.load_questions(page = 1, per_page = 10)
    includes(:p_users, :topic, :question_attachments, question_has_tags: [:tag], user: [:rank, :domain_ranks, :p_questions])
    .paginate(:page => page,:per_page => per_page)
  end

  #Retorna una pregunta por id
  def self.question_by_id(id)
    includes(:topic, :question_attachments, question_has_tags:[:tag], user: [:rank, :domain_ranks])
    .find_by_id(id)
  end

  #Retorna una pregunta por id
  def self.questions_by_ids(ids, page = 1, per_page = 10)
    load_questions(page, per_page)
    .where( questions:{id: ids} )
    .paginate(:page => page,:per_page => per_page)
  end

  #Busca coincidencias del titulo de una pregunta
  def self.questions_by_title(title, page = 1, per_page = 10)
    where("questions.title LIKE ?", "%#{title.downcase}%")
    .select("questions.id, questions.title, questions.body")
    .paginate(:page => page,:per_page => per_page)
  end

  #Consulta las preguntas hechas por un usuario
  def self.questions_by_user(user, page = 1, per_page = 10)
    load_questions(page, per_page)
    .where(questions:{user_id: user})
    .paginate(:page => page,:per_page => per_page)
  end

  #Consulta que preguntas tienen o han tenido postulaciones
  def self.postulated_question(page = 1, per_page = 10)
    joins(:postulates)
    .select("questions.id").group("questions.id")
    .paginate(:page => page,:per_page => per_page)
  end

  #Consulta que preguntas NO tienen o NUNCA han tenido postulaciones
  def self.not_postulated_question(page = 1, per_page = 10)
    load_questions(page, per_page)
    .where.not('id IN (?)', postulated_question)
    .paginate(:page => page,:per_page => per_page)
  end

  #Me retorna preguntas en un tag
  def self.questions_by_tags(tag, page = 1, per_page = 10)
    g=QuestionHasTag.where('tag_id = ?', tag).select("question_id").group("question_id")
    load_questions(page, per_page)
    .where('questions.id in (?)', g)
    .paginate(:page => page,:per_page => per_page)
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

  def self.sort_by_date( page = 1, per_page = 10)
    load_questions(page, per_page).order("questions.date_posted ASC")
  end
end
