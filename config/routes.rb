Rails.application.routes.draw do

  root to: 'welcome#show'

  resources :categories, only: [:index]
  resources :breweries, only: [:index, :show]
  resources :users, only: [:show]
  resources :favorite_breweries, only: [:show]

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/search', to: 'search#show'

  namespace :api do
    namespace :v1 do
      resources :breweries_search, only: [:index]
      resources :favorite_breweries, only: [:index]
    end
  end
end
