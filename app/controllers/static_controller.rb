class StaticController < ApplicationController
  skip_before_action :restrict_access

  def fallback_index_html
    render :file => 'public/index.html'
  end
end