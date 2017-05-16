class QuestionCustomNoRelSerializer < ActiveModel::Serializer
  type 'data'
  
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
	    data[:user_id] =object.user_id
	  end
	  if scope.include?('topic_id')
	    data[:topic_id] =object.topic_id
	  end
	  if scope.include?('difficulty')
	    data[:difficulty] =object.difficulty
	  end
	  if scope.include?('date_posted')
	    data[:date_posted]=object.date_posted
	  end
    data
  end

end
