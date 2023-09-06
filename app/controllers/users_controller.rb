class UsersController < ApplicationController
  # POST /users/register
  def register
    # Create a new user with the provided parameters
    @user = User.new(user_params)

    if @user.save
      # Successful registration
      render json: { message: "User registered successfully" }, status: :created
    else
      # Registration failed; return error messages
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # POST /users/login
  def login
    # Find the user by email
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # Successful login
      # Implement token generation logic here (e.g., using JWT)
      token = generate_token(user)
      render json: { message: "Login successful", token: token }
    else
      # Login failed
      render json: { message: "Invalid email or password" }, status: :unauthorized
    end
  end

  private

  def user_params
    # Define the allowed user parameters for registration
    params.require(:user).permit(:name, :email, :password)
  end

  def generate_token(user)
    # Implement token generation logic here
    # Return a token that can be used for authentication
  end
end
