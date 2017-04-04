class API::V1::UsersController < ApplicationController
	#Encuentra un usuario por id
	def get_user_id
		@user=User.question_by_id(params[:id])
		render json: @user
	end

	#Encuentra un usuario por username exacto
	def get_user_username
		@user=User.user_username(params[:username])
		render json: @user
	end

	#Encuentra un usuario por coincidencia
	def search_username
		@user=User.users_by_username(params[:username])
		render json: @user
	end
end
