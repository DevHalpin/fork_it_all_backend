class Api::RecipesController < ApplicationController
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

        Recipe.create!(
          :id => meal_details['idMeal'],
          :name => meal_details['strMeal'],
          :region => meal_details['strArea'],
          :instructions => meal_details['strInstructions'],
          :meal_image => meal_details['strMealThumb'],
          :meal_type => meal_details['strTags'],
          :video_url => meal_details['strYoutube'] 
        )

        # go through each key in meal_details
        meal_details.keys.each do | key |
        # if key has word ingredient and is not null and is not empty string
          if (key.include?("Ingredient") && !meal_details[key].empty?)
            #  check if in ingredients db
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
      check
    end
  end

  def index
    recipe = get_recipe('Three Fish Pie')

    render :json => {
      message: recipe.to_json
    }
  end

end