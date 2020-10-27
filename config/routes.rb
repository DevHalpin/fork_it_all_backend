Rails.application.routes.draw do

  
    scope '/api' do
      resources :users
      resources :twists
      get '/data', to: 'recipes#index'
    end
    # get 'twists/index'
    # get 'twists/create'
    # get 'twists/update'
    # get 'twists/destroy'

    # get '/twists', to: 'twists#index'


  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
