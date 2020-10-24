# class Meal
#   attr_accessor :name, :meal_id, :ingredient, :instructions, :ingredients, :measures

#   @@all = []

#   def initialize(name:, meal_id:, ingredient:)
#     @name = name
#     @meal_id = meal_id
#     @ingredient = ingredient
#     @ingredients = []  ## will be strings
#     @measures = []  ## will be strings
#     @@all << self
#   end

#   def self.all
#     @@all
#   end



# end

# class Ingredient
#   attr_accessor :name, :meals

#   @@all = []

#   def initialize(name)
#     @name = name
#     @meals = []  ### will contain OBJECTS
#     @@all << self
#   end

#   def self.all
#     @@all
#   end

#   def self.find_by_ingredient(ingredient)
#     self.all.find {|ing_obj| ing_obj.name == ingredient}
#   end

# end

class Api::RecipesController < ApplicationController
  require 'rest-client'
  require 'json'

  ## resposible for making drinks.

  # def self.get_meals(ingredient)
  #   response = RestClient.get 'https://www.themealdb.com/api/json/v1/1/filter.php?i=#{ingredient}'

  #   meals = JSON.parse(response)['meals']
  #   new_ingredient = Ingredient.new(ingredient)
  #   meals.each do |meal_details|
  #     name = meal_details["strMeal"]
  #     meal_id = meal_details["idMeal"]
  #     new_meal = Meal.new(name: name, meal_id: meal_id, ingredient: ingredient)
  #     new_ingredient.meals << new_meal
  #   end
  # end


  def index ## meal_object
    ## what is my endpoint?
    response = RestClient.get 'https://www.themealdb.com/api/json/v1/1/random.php'
    # how do I parse the response into meaningful json data?
    meal_details = JSON.parse(response)["meals"].first

    ## what do I want to do from there?
    ## add an attribute on my EXISTING meal obj
    # meal.instructions = meal_details["strInstructions"]
    # meal_details.keys.each do |k|

    #   meal.ingredients << meal_details[k] if (k.include?("Ingredient")) && meal_details[k] 
    #   meal.measures << meal_details[k] if (k.include?("Measure")) && meal_details[k]
    # end
    message = Array.new
    message.push(meal_details)

    render :json => {
      message: meal_details.to_json
    }
  end

end