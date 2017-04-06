class API::V1::UsersController < ApplicationController
<<<<<<< Updated upstream
	def index
  		@users = User.all
  		page = params[:page]
    	unless page.nil?
    		@users = User.load_users( page )
    	end
    	render json: @users
  	end
=======
	#Encuentra un usuario por coincidencia
	def search_username
		@user=User.users_by_username(params[:username])
		render json: @user
	end

>>>>>>> Stashed changes

	def show
		g=params[:id]
		m=g.to_i

		if m.to_s == g.to_s
			@user = User.find(params[:id])
			render json: @user
		else
			@user=User.user_username(params[:id])
			render json: @user
		end
		
  	end

  	#Encuentra un usuario por coincidencia
	def search_username
		@user=User.users_by_username(params[:username])
		render json: @user
	end

	def my_questions
		@question_list = Question.questions_by_user( params[:user_id] )
		render json: @question_list
	end

end
