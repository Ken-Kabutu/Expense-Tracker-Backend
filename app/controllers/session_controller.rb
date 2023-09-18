class SessionController < ApplicationController
  skip_before_action :authorize, only: :create

  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      render json: { errors: ['User not found'] }, status: :not_found
      return
    end

    if user.authenticate(params[:password])
      session[:user_id] = user.id
      
      Rails.logger.debug "After setting in session: #{session[:user_id]}"

      render json: user
    else
      render json: { errors: ['Invalid username or password'] }, status: :unauthorized
    end
  end

  def index
  end

  def destroy
    session.delete :user_id
    head :no_content
  end
end
