namespace :expired_questions do
	desc "Drop questions that exceeded 2 hours on the system, performed every day."
  	task drop_questions: :environment do
  		Question.expired_questions.delete_all
  	end
 end
