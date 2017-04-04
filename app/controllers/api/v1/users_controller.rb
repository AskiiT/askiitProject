class API::V1::UsersController < ApplicationController
	#Encuentra un usuario por coincidencia
	def search_username
		@user=User.users_by_username(params[:username])
		render json: @user
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

end
