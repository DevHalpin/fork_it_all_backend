class TwistsController < ApplicationController
  include CurrentUserConcern
  
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.find_by(access_token: token)
    end
  end
  
  def favorite
    @twist = Twist.find(params[:id])
    type = params[:type]
    if type == "favorite"
      @current_user.favorite_twists << @twist
    elsif type == "unfavorite"
      @current_user.favorites_twist.delete(@twist)
    end
  end

  def faveTwists
    @faveTwists = Recipe.joins(:twists).joins("join favorites on favorites.twist_id = twists.id").where(favorites: {user_id: @current_user.id}).select("recipes.id as recipe_id, recipes.name, recipes.meal_image, twists.id as twist_id, twists.content")
    render json: @faveTwists.to_json
  end

  def slug
    slug = params[:slug]
    @twistFromSlug = Recipe.joins(:twists).where(twists: { slug: slug }).select("recipes.id as recipe_id, twists.id as twist_id").first
    render json: @twistFromSlug.to_json
  end

  def index
    random = params[:random]
    if random
      @twists = Twist.getTwist
    elsif
      @twists = Twist.order("created_at DESC")
    end
    render json: @twists.to_json
  end

  def show
    @twist = Twist.find params[:id]
    render json: @twist.to_json
  end

  def create
    @twist = Twist.create(twist_param)
    render json: @twist
  end

  def update
    @twist = Twist.find(params[:id])
    @twist.update_attributes(twist_param)
    render json: @twist
  end

  def destroy
    @twist = Twist.find(params[:id])
    @twist.destroy
    head :no_content, status: :ok
  end
  
  private
    def twist_param
      params.require(:twist).permit(
        :recipe_id,
        :user_id,
        :tags,
        :slug,
        :is_private,
        :content
      );
    end
end
