class ApplicationController < ActionController::API
  before_action :authorize

  private

  def authorize
    Rails.logger.debug "User ID from session: #{session[:user_id]}"
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    render json: { error: "Not authorized" }, status: :unauthorized unless @current_user
  end
end
