class User < ActiveRecord::Base

  scope :order_by_date_created, -> { order("users.date_created DESC") }
  scope :order_by_created_at, -> { order("users.created_at DESC") }


  has_one :rank
  has_many :domain_ranks
  has_many :questions
  has_many :p_questions, through: :postulates, source: :question
  has_many :postulates
  has_many :followers, :foreign_key => :follower_id
  has_many :followed, :through => :followers, :source => :followed_id

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable

  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true, length: {minimum: 5 }
  validates :username, format: { with: /\A[a-zA-Z][a-zA-Z0-9]+\Z/ }
  validates :first_name, :last_name, length: {minimum: 4}
  validates_format_of :first_name, :last_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates :description, length: {maximum: 200}, allow_blank: true
  validates :first_name, :last_name, length: {maximum: 30}
  validates :username, length: {maximum: 20}
  # Just in case, it says at:https://eureka.ykyuen.info/2011/03/03/rails-%E2%80%93-add-custom-fields-to-devise-user-model/
  # Uncomment next two lines

  # # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :username, :date_created, :description
  include DeviseTokenAuth::Concerns::User
  def self.load_users(page = 1, per_page = 10)
    includes(:p_questions,:rank, domain_ranks: [:topic], questions:[:question_attachments, :topic, :question_has_tags, :p_users])
    .paginate(:page => page,:per_page => per_page)
  end

  #Selecciona segun id
  def self.user_by_id(id)
    includes(:rank, domain_ranks: [:topic], questions:[:question_attachments, :topic, :question_has_tags])
    .find_by_id(id)
  end

  #Busca por varios ids
  def self.users_by_ids(ids,page = 1, per_page = 10)
    load_users(page,per_page)
    .where( users:{id: ids} )
  end

  #Busca coincidencias con el nombre de usuario
  def self.users_by_username(username, page = 1, per_page = 10)
    where("users.username LIKE ?", "#{username.downcase}%")
    .paginate(:page => page,:per_page => per_page)
  end

  def self.user_username(username)
    where("users.username = ?", username)
  end

  #Busca coincidencias del nombre de un usuario
  def self.users_by_firstname(first_name, page = 1, per_page = 10)
      where("users.first_name LIKE ?", "%#{first_name.downcase}%")
      .select("users.id, users.username, users.first_name, users.last_name")
      .paginate(:page => page,:per_page => per_page)
  end

  #Busca coincidencias del apellido de un usuario
  def self.users_by_lastname(last_name, page = 1, per_page = 10)
      where("users.last_name LIKE ?", "%#{last_name.downcase}%")
      .select("users.id, users.username, users.first_name, users.last_name")
      .paginate(:page => page,:per_page => per_page)
  end

  #Ordena los usuarios según su rango en el tema dado
  def self.users_by_domain_rank_level(topic, page = 1, per_page = 10)
    joins(domain_ranks: :topic).where("domain_ranks.topic_id = ?",topic)
    .select("users.id, users.username, topic_id, topic_name, level").order("domain_ranks.level DESC")
    .paginate(:page => page,:per_page => per_page)
  end

  #Que usuarios se postularon a la pregunta de un usuario dado.
  def self.postulated_to_user(id, page = 1, per_page = 10)
    g=Question.questions_by_user(id).select("questions.id").group("questions.id")
    m=Postulate.where("question_id in (?)", g).select("user_id").group("user_id")
    load_users(page, per_page).where("users.id in (?)", m)
  end

  #A qué preguntas se postuló un usuario dado su id
  def self.user_postulated_to(id)
    u = user_by_id( id )
    m = Postulate.where("user_id in (?)", u).select("question_id")
    Question.load_questions.where("questions.id in (?)", m)
  end

  #Ver qué rango tengo en un Topic específico
  def self.user_level_by_topic( userid, topicic )
    joins( domain_ranks: :topic )
    .where( [ "domain_ranks.topic_id = ? AND domain_ranks.user_id = ?", topicic, userid ] )
    .select( "topic_name, level" )
  end

  # Consulta los usuarios que  están postulados a una pregunta específica
  def self.users_by_question(queid, page = 1, per_page = 10)
    joins( postulates: :question)
    .where(["postulates.question_id = ?",queid])
    .paginate(:page => page,:per_page => per_page)
  end

  def self.users_id_name(name)
    find_by(username: name).id
  end

  # Ver los seguidores de un usuario por su id
  def self.user_followers(userid, page = 1, per_page = 10)
    joins(:followers)
    .where(["followers.followed_id = ?",userid])
    .paginate(:page => page,:per_page => per_page)
  end

  # Ver los seguidos de un usuario por su id
  def self.user_follows(userid, page = 1, per_page = 10)
    u = Follower.where(["follower_id = ?",userid]).select("followed_id").group("followed_id")
    load_users(page, per_page).where("users.id in  (?)", u)
  end

  # Ordena los usuarios basado en su rapidez por su rango
  def self.user_by_quickness
      joins(:rank).order("ranks.quickness DESC").select("users.id,quickness")
  end
  # Ordena los usuarios basado en su claridad por su rango
  def self.user_by_clarity
      joins(:rank).order("ranks.clarity DESC").select("users.id,clarity")
  end

  # Ordena los usuarios basado en su efectividad por su rango
  def self.user_by_efectiveness
      joins(:rank).order("ranks.efectiveness DESC").select("users.id,efectiveness")
  end

  def self.user_made_tag(tag, page = 1, per_page = 10)
    joins(questions: :question_has_tags).where("question_has_tags.tag_id=(?)", tag)
    .paginate(:page => page,:per_page => per_page)
  end
end
