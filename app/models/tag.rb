class Tag < ApplicationRecord
  belongs_to :topic
  has_many :questions, through: :question_has_tags
  has_many :question_has_tags
end
