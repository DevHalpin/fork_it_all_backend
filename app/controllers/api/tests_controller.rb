class Api::TestsController < ApplicationController
  require 'rest-client'

  def index
    response = RestClient.get 'https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata'

    # newResponse = JSON.parse(response)
    puts response
    parsed = JSON.parse(response.body)
    puts parsed.class
    mealsObj = parsed['meals']
    puts mealsObj.first['strMeal']
    puts mealsObj.each
    # strMeal = newResponse[:strMeal]
    

    render :json => {
      message: mealsObj.first['strMeal']
    }
  end
end