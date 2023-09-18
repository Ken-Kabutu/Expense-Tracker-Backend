class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  before_action :authorize

  private

  def authorize
    Rails.logger.debug "session[:user_id]: #{session[:user_id]}"

    if session[:user_id].nil?
      render json: { errors: ['Not Authorized'] }, status: :unauthorized
      return
    end

    @current_user = User.find(session[:user_id])

    return unless @current_user.nil?

    render json: { errors: ['Not Authorized'] }, status: :unauthorized
    nil
  end

  def render_unprocessable_entity_response(exeption)
    render json: { errors: exeption.record.errors.full_messages }, status: :unprocessable_entity
  end
end
