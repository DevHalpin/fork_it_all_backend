class Api::TestsController < ApplicationController
  require 'rest-client'

  def index
    response = RestClient.get 'https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata'

    puts response

    render :json => {
      message: response
    }
  end
end