class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  def default_url
    ActionController::Base.helpers.asset_path("default.png")
  end

  def fallback_index_html
    render :file => 'public/index.html'
  end
end
