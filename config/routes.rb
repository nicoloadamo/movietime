Rails.application.routes.draw do
  resources :requests
  resources :reviews
  resources :events
  devise_for :users
  # Define the show of the user
  resources :users, only: [:show]
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
