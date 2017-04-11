Rails.application.routes.draw do
  resources :categories, only: [:index]
  resources :breweries, only: [:index]
end
