Rails.application.routes.draw do

  namespace :api do # /api/data

    get '/data', to: 'tests#index'

  end

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
