# Add a controller for user session
class SessionsController < ApplicationController
  include CurrentUserConcern

  def new
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end

  def create
    # Does an existing user put in the correct password?
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      # We save the user information in a browser cookie
      # user remains logged in as they navigate page to page
      session[:user_id] = @user.id
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
    session[:user_id] = nil
    render json: {status: 200, logged_out: true}
  end

end