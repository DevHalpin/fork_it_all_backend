class RecipesController < ApplicationController
  require 'rest-client'
  require 'json'

  def get_recipe(word)
    @check = Recipe.where(Recipe.arel_table[:name].matches("%#{word}%"))
    if ( @check.empty? )
      response = RestClient.get("https://www.themealdb.com/api/json/v1/1/search.php?s=#{word}")
      meal = JSON.parse(response)

      if (!meal['meals'].nil?)
        meal_details = meal["meals"].first
        Recipe.create!(
          :name => meal_details['strMeal'],
          :region => meal_details['strArea'],
          :instructions => meal_details['strInstructions'],
          :meal_image => meal_details['strMealThumb'],
          :meal_type => meal_details['strTags'],
          :video_url => meal_details['strYoutube'], 
          :ingredient1 => meal_details['strIngredient1'],
          :ingredient2 => meal_details['strIngredient2'],
          :ingredient3 => meal_details['strIngredient3'],
          :ingredient4 => meal_details['strIngredient4'],
          :ingredient5 => meal_details['strIngredient5'],
          :ingredient6 => meal_details['strIngredient6'],
          :ingredient7 => meal_details['strIngredient7'],
          :ingredient8 => meal_details['strIngredient8'],
          :ingredient9 => meal_details['strIngredient9'],
          :ingredient10 => meal_details['strIngredient10'],
          :ingredient11 => meal_details['strIngredient11'],
          :ingredient12 => meal_details['strIngredient12'],
          :ingredient13 => meal_details['strIngredient13'],
          :ingredient14 => meal_details['strIngredient14'],
          :ingredient15 => meal_details['strIngredient15'],
          :ingredient16 => meal_details['strIngredient16'],
          :ingredient17 => meal_details['strIngredient17'],
          :ingredient18 => meal_details['strIngredient18'],
          :ingredient19 => meal_details['strIngredient19'],
          :ingredient20 => meal_details['strIngredient20'],
          :measure1 => meal_details['strMeasure1'],
          :measure2 => meal_details['strMeasure2'],
          :measure3 => meal_details['strMeasure3'],
          :measure4 => meal_details['strMeasure4'],
          :measure5 => meal_details['strMeasure5'],
          :measure6 => meal_details['strMeasure6'],
          :measure7 => meal_details['strMeasure7'],
          :measure8 => meal_details['strMeasure8'],
          :measure9 => meal_details['strMeasure9'],
          :measure10 => meal_details['strMeasure10'],
          :measure11 => meal_details['strMeasure11'],
          :measure12 => meal_details['strMeasure12'],
          :measure13 => meal_details['strMeasure13'],
          :measure14 => meal_details['strMeasure14'],
          :measure15 => meal_details['strMeasure15'],
          :measure16 => meal_details['strMeasure16'],
          :measure17 => meal_details['strMeasure17'],
          :measure18 => meal_details['strMeasure18'],
          :measure19 => meal_details['strMeasure19'],
          :measure20 => meal_details['strMeasure20'])

        Recipe.where(Recipe.arel_table[:name].matches("%#{word}%")).first
      else
        'Nothing found'
      end
    else
      @check.first
    end
  end

  def index
    search = params[:search]
    random = params[:random]
    three = params[:three]
    if search
      @recipe = get_recipe(search)
    elsif random
      @recipe = Recipe.get_random
    elsif three
      @recipe = Recipe.get_three
    else
      @recipe = Recipe.all
    end
    
    render :json => @recipe.to_json
  end

  def show  
    three = params[:three]
    random = params[:random]
    twist = params[:twist]
    if three
      @recipe = Recipe.get_three
    elsif random
      @recipe = Recipe.joins(:twists).joins("join users on twists.user_id = users.id").where(twists: {is_private: false}, recipes: {id: params[:id]}).select("twists.content, twists.id, twists.slug, users.handle").sample
    elsif twist
      @recipe = Recipe.joins(:twists).joins("join users on twists.user_id = users.id").where(twists: {is_private: false, id: params[:twist]}, recipes: {id: params[:id]}).select("twists.content, twists.id, twists.slug, users.handle").first
    else
      @recipe = Recipe.find params[:id]
    end
    render json: @recipe.to_json
  end

end