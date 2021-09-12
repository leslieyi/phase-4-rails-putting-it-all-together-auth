class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  before_action :authorize

  private 
  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end 

  def authorize 
    user = User.find_by(id: session[:user_id]) #session is sticky? between reqeusts
    if user
       @current_user = user
    else 
        render json: {errors: ["User not found"] }, status: :unauthorized
    end
  end


end
