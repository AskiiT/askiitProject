class User < ActiveRecord::Base
  after_initialize :default_avatar
  after_create :ranks_and_domains
  has_many :notifications
  has_one :rank
  has_many :domain_ranks
  has_many :questions
  has_many :p_questions, through: :postulates, source: :question
  has_many :postulates
  has_many :followers, :foreign_key => :follower_id
  has_many :followed, :through => :followers, :source => :followed_id
  belongs_to :avatar
  has_many :tags, through: :subscribed_to_tag
  has_many :subscribed_to_tag

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable#, :confirmable

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
  scope :order_newest, -> { order("users.date_created DESC") }
  scope :order_oldest, -> { order("users.date_created ASC") }
  scope :order_usn, -> { order("users.username DESC") }
  scope :order_asc_usn, -> { order("users.username ASC") }
  scope :order_fst, -> { order("users.first_name DESC") }
  scope :order_asc_fst, -> { order("users.first_name ASC") }
  scope :order_lst, -> { order("users.last_name DESC") }
  scope :order_asc_lst, -> { order("users.last_name ASC") }
  scope :order_desc, -> { order("users.description DESC") }
  scope :order_asc_desc, -> { order("users.description ASC") }
  scope :order_email, -> { order("users.email DESC") }
  scope :order_asc_email, -> { order("users.email ASC") }
  scope :order_id, -> { order("users.id DESC") }
  scope :order_asc_id, -> { order("users.id ASC") }
  scope :order_color, -> { order("users.color DESC") }
  scope :order_asc_color, -> { order("users.color ASC") }

  def self.sort_by(query1, sort)
    case sort
    when 1
      query1= query1.order_newest
    when 2
      query1= query1.order_oldest
    when 3
      query1= query1.order_usn
    when 4
      query1= query1.order_asc_usn
    when 5
      query1= query1.order_fst
    when 6
      query1= query1.order_asc_fst
    when 7
      query1= query1.order_lst
    when 8
      query1= query1.order_asc_lst
    when 9
      query1= query1.order_desc
    when 10
      query1= query1.order_asc_desc
    when 11
      query1= query1.order_email
    when 12
      query1= query1.order_asc_email
    when 13
      query1= query1.order_id
    when 14
      query1= query1.order_asc_id
    when 15
      query1= query1.order_color
    when 16
      query1= query1.order_asc_color
    end
    query1
  end


  def self.load_users(sort=13, page = 1, per_page = 10)
    g=includes(:p_questions,:rank, domain_ranks: [:topic], questions:[:question_attachments, :topic, :question_has_tags, :p_users])
    g=User.sort_by(g, sort)
    g.paginate(:page => page,:per_page => per_page)
  end

  def self.whole (sort=13)
    g=all
    g=User.sort_by(g, sort)
  end

  def default_avatar
     self.avatar ||= Avatar.find_by_id(1)
  end

  after_create :default_date
  def default_date
     self.date_created = self.created_at;
     self.save
  end

  def ranks_and_domains
    us=self.id
    r=Rank.new
    r.user_id=us
    r.save
    am=Topic.all.size
    for j in 1..am do
       dr=DomainRank.new
       dr.user_id=us
       dr.topic_id=j
       dr.id=(us.to_s+'010'+j.to_s).to_i
       dr.save
    end
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
  def self.users_by_username(username, sort=13, page = 1, per_page = 10)
    g=where("users.username LIKE ?", "%#{username.downcase}%")
    g=User.sort_by(g, sort)
    g.paginate(:page => page,:per_page => per_page)
  end

  def self.user_username(username)
    where("users.username = ?", username)
  end

  #Busca coincidencias del nombre de un usuario
  def self.users_by_firstname(first_name, sort=13, page = 1, per_page = 10)
      g=where("users.first_name LIKE ?", "%#{first_name.downcase}%")
      g=User.sort_by(g, sort)
      g.paginate(:page => page,:per_page => per_page)
  end

  #Busca coincidencias del apellido de un usuario
  def self.users_by_lastname(last_name, sort=13, page = 1, per_page = 10)
      g=where("users.last_name LIKE ?", "%#{last_name.downcase}%")
      g=User.sort_by(g, sort)
      .paginate(:page => page,:per_page => per_page)
  end

  #Busca coincidencias exactas de correo electrónico
  def self.user_by_email(email, sort=13)
      g=where("users.email LIKE ?", "#{email}")
  end

  #Ordena los usuarios según su rango en el tema dado
  def self.users_by_domain_rank_level(topic, page = 1, per_page = 10)
    joins(domain_ranks: :topic).where("domain_ranks.topic_id = ?",topic)
    .order("domain_ranks.level DESC")
    .paginate(:page => page,:per_page => per_page)
  end

  #Que usuarios se postularon a la pregunta de un usuario dado.
  def self.postulated_to_user(id, page = 1, per_page = 10)
    g=Question.questions_by_user(id).select("questions.id").group("questions.id")
    m=Postulate.where("question_id in (?)", g).select("user_id").group("user_id")
    load_users(page, per_page).where("users.id in (?)", m)
  end

  #A que usuarios se postuló este usuario dado.
  def self.who_it_postulated(id, page = 1, per_page = 10)
    m=Postulate.where("user_id = (?)", id).select("question_id").group("question_id")
    g=Question.where("questions.id in (?)", m).select("questions.user_id").group("questions.user_id")
    load_users(page, per_page).where("users.id in (?)", g)
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
  def self.users_by_question(queid, sort=13, page = 1, per_page = 10)
    g=joins( postulates: :question).where(["postulates.question_id = ?",queid])
    g=User.sort_by(g, sort)
    g.paginate(:page => page,:per_page => per_page)
  end

  def self.users_id_name(name)
    find_by(username: name).id
  end

  # Ver los seguidores de un usuario por su id
  def self.user_followers(userid, sort=13, page = 1, per_page = 10)
    g=joins(:followers).where(["followers.followed_id = ?",userid])
    g=User.sort_by(g, sort)
    g.paginate(:page => page,:per_page => per_page)
  end

  # Ver los seguidos de un usuario por su id
  def self.user_follows(userid, page = 1, per_page = 10)
    u = Follower.where(["follower_id = ?",userid]).select("followed_id").group("followed_id")
    load_users(page, per_page).where("users.id in  (?)", u)
  end

  # Ordena los usuarios basado en su rapidez por su rango
  def self.user_by_quickness(page = 1, per_page = 10)
      joins(:rank).order("ranks.quickness DESC")
      .paginate(:page => page,:per_page => per_page)
  end
  # Ordena los usuarios basado en su claridad por su rango
  def self.user_by_clarity(page = 1, per_page = 10)
      joins(:rank).order("ranks.clarity DESC")
      .paginate(:page => page,:per_page => per_page)
  end

  # Ordena los usuarios basado en su efectividad por su rango
  def self.user_by_efectiveness(page = 1, per_page = 10)
      joins(:rank).order("ranks.efectiveness DESC")
      .paginate(:page => page,:per_page => per_page)
  end

  #Qué usuario ha usado el Tag "tag"
  def self.user_made_tag(tag, page = 1, per_page = 10)
    joins(questions: :question_has_tags).where("question_has_tags.tag_id=(?)", tag)
    .paginate(:page => page,:per_page => per_page)
  end

  #Qué usuario ha usado el tema "topic"
  def self.user_made_topic(topic, page = 1, per_page = 10)
    joins( :questions ).where("questions.topic_id= (?) ", topic)
    .paginate(:page => page,:per_page => per_page)
  end
end
