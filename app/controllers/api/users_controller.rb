class Api::UsersController < ApplicationController

  def index


    @users = User.all.order(created_at: :desc)

    render :json => {
      message: @users.to_json
    }
  end
end