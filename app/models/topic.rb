class Topic < ApplicationRecord
	has_many :tags
	has_many :questions
	has_many :domain_ranks

	validates :topic_name, presence: true
	validates :topic_name, uniqueness: true
	validates :topic_name, length: { minimum: 2, maximum: 20 }
	validates :topic_description, length: { maximum: 200 }

	def self.load_topics
    	includes(:tags, questions: [:question_attachments, :user, :question_has_tags], domain_ranks:[:user])
  	end

  	def self.topic_by_id(id)
    	includes(:tags, questions: [:question_attachments, :user, :question_has_tags], domain_ranks:[:user])
    	.find_by_id(id)
  	end

	def self.topics_by_name(topic_name)
	   load_topics.where("topics.topic_name LIKE ?", "#{topic_name.downcase}%")
	end

end
