class API::V1::UsersController < ApplicationController
	def index
			p = params[:page]
			unless p.nil?
				@users = User.load_users( p )
			else
				@users = User.all
			end
    	if @users.empty?
  			render json: 
  				{ data:
  					{
  						error: "No more users to show."
  					}
  				}
  		else
    		render json: @users
  		end
  	end
  	
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
