# Add a controller for user session
class SessionsController < ApplicationController
  skip_before_action :restrict_access, only: [:create, :destroy]

  def new
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user,
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    @current_user.update_attributes(access_token: nil)
    render json: { status: 200, logged_out: true }
  end

  def create
    # Does an existing user put in the correct password?
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      # We save the user information in a browser cookie
      # user remains logged in as they navigate page to page
      @user.update_attributes(access_token: SecureRandom.hex)
      render json: {
        status: :created,
        logged_in: true,
        user: @user
      }
      # redirect_to "/"

    else
    # Returns a user to login form if they don't authenticate.
     render json: {
       status: 401
     }
    end

  end

#destroy cookie on logout
  def destroy
  end

end