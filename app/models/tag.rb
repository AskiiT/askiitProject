class Tag < ApplicationRecord
 	belongs_to :topic
 	has_many :questions, through: :question_has_tags
 	has_many :question_has_tags

 	validates :tag_name, presence: true
	validates :tag_name, uniqueness: true
	validates :tag_name, length: { minimum: 2, maximum: 20 }
end
