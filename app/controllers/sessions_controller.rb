class SessionsController < ApplicationController
    skip_before_action :authorize, only: :create

    def create #/login
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created 
        else 
            render json: { errors: ["Invalid username or password"] }, status: :unauthorized 
        end
    end

    def destroy #/logout
        session.delete(:user_id)
        head :no_content
    end
#depending on the frontend is configured, you need to change the error either as s string or an array etc. 

    
end
