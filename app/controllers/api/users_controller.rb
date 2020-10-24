class Api::UsersController < ApplicationController

  def index
    render :json => {
      message: "Explosions?"
    }
  end
end
