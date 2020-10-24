class Api::UsersController < ApplicationController

  def index


    @users = User.all.order(created_at: :desc)
    # puts @users.inspect
    

    @users.each do | user |
      example = Array(user)
      puts example.inspect
    end

    # puts users.inspect

    render :json => {
      message: @users.to_json
    }
  end
end