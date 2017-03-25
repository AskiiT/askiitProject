class Tag < ApplicationRecord
 	belongs_to :topic
 	has_many :questions, through: :question_has_tags
 	has_many :question_has_tags

 	validates :tag_name, presence: true
	validates :tag_name, uniqueness: true
	validates :tag_name, length: { minimum: 2, maximum: 20 }
	def self.load_tags
    	includes(:topic, question_has_tags:[questions:[:question_attachments, :users, :topics]])
	end

	def self.tag_by_id(id)
    	includes(:topic, question_has_tags:[questions:[:question_attachments, :users, :topics]])
    	.find_by_id(id)
  	end

 	def self.tags_by_name(tag_name)
	   load_tags.where("tags.tag_name LIKE ?", "%#{tag_name.downcase}%")
	end

end
