Rails.application.routes.draw do
  # Define the show of the user
  resources :users, only: [ :index, :show, :update]
  root to: "pages#home"
  resources :reviews
  devise_for :users
  resources :events
  resources :requests do
    member do
      post 'accept'
      post 'reject'
    end
  end
end
