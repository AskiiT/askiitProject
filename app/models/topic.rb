class Topic < ApplicationRecord
	has_many :tags
	has_many :questions
	has_many :domain_ranks
	has_many :users
	
	validates :topic_name, presence: true
	validates :topic_name, uniqueness: true
	validates :topic_name, length: { minimum: 2, maximum: 30 }
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
	   	.where("upper(topics.topic_name) LIKE ?", "%#{topic_name.upcase}%")
	end

	#Retorna a que temas un usuario ha dado una pregunta
	def self.topics_by_user(user, page = 1, per_page = 10)
		load_topics(page, per_page)
		.joins(questions: [:user]).where(questions:{user_id: user})
		.select("topics.id, topics.topic_name")
		.distinct
	end

	#Ver el topic de un tag

	def self.topic_of_tag(tag)
		joins(:tags).where("tags.id = ?", tag)
	end

	#id del topic por name
	def self.topic_id_name(name)
		name=name.downcase
		u = where("lower(topic_name) = ?", name)
	    if u.empty?
	    	g=-1
	    else
    	    g=u.first.id
	    end
      	g
	end

	def self.topic_in_question(questions)
		joins(:questions).where("questions.id=?", questions)
	end

end
