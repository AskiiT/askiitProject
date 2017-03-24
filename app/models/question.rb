class Question < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :question_attachments,               :dependent => :destroy
  has_many :tags, through: :question_has_tags
  has_many :question_has_tags
  has_many :users, through: :postulates
  has_many :postulates

  validates :title, :difficulty, :date_posted, presence: true
  validates :title, length: { in: 12..140 }
  validates_inclusion_of :difficulty, in: 1..10
  validates :body, length: {maximum: 500}, allow_blank: true


end
