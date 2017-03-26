class Tag < ApplicationRecord
 	belongs_to :topic
 	has_many :questions, through: :question_has_tags
 	has_many :question_has_tags

 	validates :tag_name, presence: true
	validates :tag_name, uniqueness: true
	validates :tag_name, length: { minimum: 2, maximum: 20 }
	def self.load_tags
    	includes(:topic, question_has_tags:[question:[:question_attachments, :user, :topic]])
	end

	def self.tag_by_id(id)
    	includes(:topic, question_has_tags:[question:[:question_attachments, :user, :topic]])
    	.find_by_id(id)
  	end

 	def self.tags_by_name(tag_name)
	   load_tags.where("tags.tag_name LIKE ?", "%#{tag_name.downcase}%")
	end

	def self.tags_in_question(question)
		g=QuestionHasTag.where('question_id = ?', question).select("tag_id").group("tag_id")
		load_tags.where('tags.id in (?)', g)
  	end
end
