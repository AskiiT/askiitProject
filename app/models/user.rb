class User < ActiveRecord::Base
  has_one :rank
  has_many :questions
  has_many :domain_ranks
  has_many :questions, through: :postulates
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
  def self.load_users
    includes(:rank, domain_ranks: [:topic], questions:[:question_attachments, :topic, :question_has_tags])
  end 

  def self.user_by_id(id)
    includes(:rank, domain_ranks: [:topic], questions:[:question_attachments, :topic, :question_has_tags])
    .find_by_id(id)    
  end

  def self.users_by_username(username)
    load_users.where("users.username LIKE ?", "#{username.downcase}%")
  end

  def self.users_by_firstname(first_name)
    load_users.where("users.first_name LIKE ?", "%#{first_name.downcase}%")
  end

  def self.users_by_lastname(last_name)
    load_users.where("users.last_name LIKE ?", "%#{last_name.downcase}%")
  end

end
