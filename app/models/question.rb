class Question < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :question_attachments
  has_many :tags, through: :question_has_tags
  has_many :question_has_tags
end
