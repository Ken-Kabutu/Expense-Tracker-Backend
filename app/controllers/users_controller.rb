class UsersController < ApplicationController
  # POST /users/register
  def register
    Rails.logger.info "Received parameters: #{params.inspect}"

    @user = User.new(user_params)

    if @user.save
      reset_session

      # If you are using session-based authentication:
      session[:user_id] = @user.id

      # Return success message
      render json: { message: "User registered and logged in successfully" }, status: :created
    else
      error_messages = @user.errors.full_messages
      render json: { errors: error_messages }, status: :unprocessable_entity
    end
  end

  # GET /users/register
  def new
  end

  # POST /users/login
  def login
    # Find the user by email
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # Successful login
      reset_session  # Reset the session to prevent fixation attacks
      session[:user_id] = user.id
      render json: { message: "Login successful" }, status: :ok
    else
      # Login failed
      render json: { message: "Invalid email or password" }, status: :unauthorized
    end
  end

  # GET /users
  def index
    users = User.all
    render json: users
  end

  # GET /users/:id
  def show
    user = User.find(params[:id])
    render json: user
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end

  private

  def user_params
    user_data = params[:user] || params
    user_data.permit(:name, :email, :password)
  end
  

  def generate_token(user)
    # Implement token generation logic here
    # Return a token that can be used for authentication
  end
end
