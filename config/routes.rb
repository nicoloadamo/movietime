Rails.application.routes.draw do
  get 'user_events/index'
  root to: "pages#home"

  # User for creating, updating and deleting users -> Inside of the registrations_controller
  devise_for :users

  # Responsible for displaying user and page only
  resources :users, only: %i[show] do
    resources :requests
    resources :user_events, path: :events, only: %i[index]
  end

  resources :requests, only: [] do
    member do
      post 'accept'
      post 'reject'
    end
  end

  resources :events do
    resources :reviews, only: %i[index new create]
  end
end
