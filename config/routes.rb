Rails.application.routes.draw do

  scope '/api' do
    resources :users
    resources :twists do
      put :favorite, on: :member
    end
    resources :recipes
    resources :sessions
    resources :registrations
    get :myTwists, to: "users#myTwists"
    get :faveTwists, to: "twists#faveTwists"
    delete :logout, to: "sessions#logout"
    get :logged_in, to: "sessions#logged_in"
  end    

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
