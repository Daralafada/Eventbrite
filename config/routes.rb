Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users
  resources :users 
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
