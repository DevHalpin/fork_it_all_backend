class UsersController < ApplicationController
  def index
    users = User.order("created_at DESC")
    render json: users.to_json
  end

  def show
    user = User.find params[:id]
    twists = User.getTwists(params[:id])
    render json: {twists: twists, user: user}
  end

  def create
    user = User.create(user_param)
    session[:user_id] = user.id
    #redirect after login
    redirect_to '/'
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(user_param)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head :no_content, status: :ok
  end
  
  private
    def user_param
      params.require(:user).permit(:email, :profile_picture, :handle, :name, :bio)
    end
end