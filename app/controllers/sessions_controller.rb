# Add a controller for user session
class SessionsController < ApplicationController

  def new
  end

  def create
    # Does an existing user put in the correct password?
    if user = User.authenticate_with_credentials(params[:email])
      # We save the user information in a browser cookie
      # user remains logged in as they navigate page to page
      session[:user_id] = user.id
      @current_user = User.find(session[:user_id])
      render json: {
        logged_in: true,
        user: @current_user
      }
      # redirect_to "/"

    else
    # Returns a user to login form if they don't authenticate.
     render json: {
       logged_in: false
     }
    end

  end

#destroy cookie on logout
  def destroy
    session[:user_id] = nil
    render json: {status: 200, logged_out: true}
  end

end