class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  include ActionController::HttpAuthentication::Token::ControllerMethods

  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :restrict_access

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.find_by(access_token: token)
    end
  end
end
