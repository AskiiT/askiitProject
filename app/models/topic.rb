class Topic < ApplicationRecord
	has_many :tags
	has_many :questions
	has_many :domain_ranks

	validates :topic_name, presence: true
	validates :topic_name, uniqueness: true
	validates :topic_name, length: { minimum: 2, maximum: 20 }
	validates :topic_description, length: { maximum: 200 }

	def self.load_topics(page = 1, per_page = 10)
    	includes(:tags, questions: [:question_attachments, :user, :question_has_tags], domain_ranks:[:user])
    	.paginate(:page => page,:per_page => per_page)
  	end

  	def self.topic_by_id(id)
    	includes(:tags, questions: [:question_attachments, :user, :question_has_tags], domain_ranks:[:user])
    	.find_by_id(id)
  	end

  	def self.topics_by_ids(ids, page = 1, per_page = 10)
  		load_topics(page, per_page)
  			.where( topics: { id: ids } )
  	end

  	#Me retorna coincidencias con el titulo de un tema
	def self.topics_by_name(topic_name, page = 1, per_page = 10)
	   load_topics(page, per_page)
	   	.where("topics.topic_name LIKE ?", "#{topic_name.downcase}%")
	end

	#Retorna a que temas un usuario ha dado una pregunta
	def self.topics_by_user(user, page = 1, per_page = 10)
		load_topics(page, per_page)
			.joins(questions: [:user]).where(questions:{user_id: user}).distinct
	end
end
