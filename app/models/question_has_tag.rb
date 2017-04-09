class QuestionHasTag < ApplicationRecord
  belongs_to :question
  belongs_to :tag

  validates_uniqueness_of :question, :scope => [:tag]
  validate :TagInTopic


  def self.topic_of_tag(tag)
  	g=Tag.find_by_id(tag).topic_id
  	g.to_i
  end

  def self.topic_of_question(question)
  	g=Question.find_by_id(question).topic_id
  	g.to_i
  end

  def getTopic
  	Topic.topic_in_question(question_id)
  end
  def TagInTopic
	   if question_id && tag_id
	   		to_o_tag=QuestionHasTag.topic_of_tag(tag_id)
	   		to_o_qu=QuestionHasTag.topic_of_question(question_id)
	    	if  to_o_tag != to_o_qu
			        errors.add(:tag_id, "This tag doesn't belongs to topic")
		    end
	   end
  end

end
