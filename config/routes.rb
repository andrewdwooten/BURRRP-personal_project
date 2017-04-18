Rails.application.routes.draw do
  resources :categories, only: [:index]
  resources :breweries, only: [:index, :show]
  root to: 'welcome#show'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/search', to: 'search#show'

  namespace :api do
    namespace :v1 do
      resources :breweries_search, only: [:index]
    end
  end
end
