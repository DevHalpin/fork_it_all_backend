class RecipesController < ApplicationController
  require 'rest-client'
  require 'json'

  def get_recipe(word)
    check = Recipe.where(Recipe.arel_table[:name].matches("%#{word}%"))
    ## what is my endpoint?
    if ( check.empty? )
      response = RestClient.get("https://www.themealdb.com/api/json/v1/1/search.php?s=#{word}")
      meal = JSON.parse(response)

      if (!meal['meals'].nil?)
        # how do I parse the response into meaningful json data?
        meal_details = meal["meals"].first
        counter = 0
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
        
        # go through each key in meal_details
        meal_details.keys.each do | key |
        # if key has word ingredient and is not null and is not empty string
          if (key.include?("Ingredient") && !meal_details[key].empty?)
            if (Ingredient.where(name: meal_details[key]).empty?)
              # if exists
              # check measures table for measures
              # if not, push to measures table
              Ingredient.create!(
                :name => meal_details[key]
              )
        #  if not, push to db and push to measures
            else
              puts 'Here'
            end
          end
        end

        meal_details
      else
        'Nothing found'
      end
    else
      check.first
    end
  end

  def index
    recipe = get_recipe('Potato')

    render :json => {
      message: recipe.to_json
    }
  end

  def show
    recipe = Recipe.find params[:id]
    render json: recipe.to_json
  end

end