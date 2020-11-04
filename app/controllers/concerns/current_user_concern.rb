module CurrentUserConcern extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    @current_user = User.find { |x| !x["access_token"].blank? }
  end
  
end