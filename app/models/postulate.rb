class Postulate < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates_uniqueness_of :question, :scope => [:user]
  validate :SameUser

  def self.user_of_question(question)
  	g=Question.find_by_id(question).user_id
  	g.to_i
  end

  def SameUser
	   if question_id && user_id
	   		u_o_q=Postulate.user_of_question(question_id)
	    	if  u_o_q == user_id
			        errors.add(:user_id, "You can't postulate to your own question")
		    end
	   end
  end

end
