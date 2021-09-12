class UsersController < ApplicationController

    skip_before_action :authorize, only: :create

    def create #/signup
        user = User.create!(user_params)
        session[:user_id] = user.id #Save the user's ID in the session hash
        render json: user, status: :created
    end

    def show #/me
        render json: @current_user, status: :accepted
    end


    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end


  
end
