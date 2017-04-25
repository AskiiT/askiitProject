class Tag < ApplicationRecord
 	require 'will_paginate/array'
 	has_many :questions, through: :question_has_tags
 	has_many :question_has_tags

 	validates :tag_name, presence: true
	validates :tag_name, uniqueness: true
	validates :tag_name, length: { minimum: 2, maximum: 30 }
  validates :tag_name, format: { with: /\A[a-zA-Z][a-zA-Z0-9 ]+\Z/ }
	def self.load_tags(page = 1, per_page = 10)
    	includes(question_has_tags:[question:[:question_attachments, :user, :topic]])
		.paginate(:page => page,:per_page => per_page)
	end
	#Selecciona tag segun id
	def self.tag_by_id(id)
    	includes(question_has_tags:[question:[:question_attachments, :user, :topic]])
    	.find_by_id(id)
  	end

  	#Busca coincidencias del nombre de un tag
 	def self.tags_by_name(tag_name)
	   where("tags.tag_name LIKE ?", "%#{tag_name.upcase}%")
	end

	#Busca tags hay en una pregunta
	def self.tags_in_question(question)
		g=QuestionHasTag.where('question_id = ?', question).select("tag_id").group("tag_id")
		where('tags.id in (?)', g)
  end


  	#Me retorna los tags en los que ha posteado un usuario.
  	def self.tags_by_user(user)
  		joins(questions: :user).where("users.id=(?)", user)
  	end

    def self.tag_id_name(name)
      name=name.downcase
      u=where("lower(tag_name) = ?", name)
      if u.empty?
        g=-1
      else
        g=u.first.id
      end
      g
    end


end
