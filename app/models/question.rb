class Question < ApplicationRecord
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

  def self.load_questions
    includes(:p_users, :topic, :question_attachments, question_has_tags:[:tags], user: [:rank, :domain_ranks], postulates: [:user])
  end
  

  def self.question_by_id(id)
    includes(:topic, :question_attachments, question_has_tags:[:tags], user: [:rank, :domain_ranks])
    .find_by_id(id)
  end

  def self.questions_by_title(title)
    load_questions.where("questions.title LIKE ?", "%#{title.downcase}%")
  end

  def self.questions_by_user(user)
    load_questions.where(questions:{user_id: user})
  end

  def self.postulated_question
    joins(:postulates)
    .select("questions.id").group("questions.id")
  end

  def self.not_postulated_question
    load_questions.where.not('id IN (?)', postulated_question)
  end
end
