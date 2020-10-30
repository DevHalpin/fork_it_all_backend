class UsersController < ApplicationController
  include CurrentUserConcern

  def myTwists
    @myTwists = Recipe.joins(:twists).where(twists: {user_id: @current_user}).select("recipes.id as recipe_id, recipes.name, recipes.meal_image, twists.id as twist_id, twists.content")
    render json: @myTwists
  end

  def index
    users = User.order("created_at DESC")
    render json: users.to_json
  end

  def show
    #define our search queries
    recipe = Recipe.find params[:recipes]
    user = params[:id]
    if user
    user = User.find params[:id]
    end
  
    
    puts "user is now", user.id
    if recipe
      puts "Recipe ID: ", recipe.id
    twists = User.getTwists(user.id, recipe.id).to_a
    end
    render json: {twists: twists, user: user, recipe: recipe}
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