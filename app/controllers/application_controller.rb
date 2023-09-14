class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  before_action :authorize

  private

  def authorize
    currentUserId = request.headers["userSession"]

    @current_user = User.find_by(id: currentUserId)
    render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
  end

  def render_unprocessable_entity_response(exeption)
    render json: { errors: exeption.record.errors.full_messages }, status: :unprocessable_entity
  end
end
