class QuestionCustomSerializer < ActiveModel::Serializer
  type 'data'
  has_many :tags
  has_many :p_users
  has_many :question_attachments

  def attributes(ser, atrr)
  	  data={}
	  if scope.include?('id')
	    data[:id] =object.id
	  end
	  if scope.include?('title')
	    data[:title] =object.title
	  end
	  if scope.include?('body')
	    data[:body] =object.body
	  end
	  if scope.include?('user_id')
	    data[:user] =object.user
	  end
	  if scope.include?('topic_id')
	    data[:topic] =object.topic
	  end
	  if scope.include?('difficulty')

	    data[:difficulty] =object.difficulty
	  end
	  if scope.include?('date_posted')
	    data[:date_posted]=object.date_posted
	  end
    data
  end
  def belongs_to(data)

  end
end
