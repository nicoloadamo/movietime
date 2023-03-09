Rails.application.routes.draw do
  get 'user_events/index'
  root to: "pages#home"

  devise_for :users # User for creating, updating and deleting users -> Inside of the registrations_controller

  resources :users, only: [ :show ] do # Responsible for displaying user and page only
    resources :requests do
      member do
        post 'accept'
        post 'reject'
      end
    end

    resources :reviews, only: [ :new, :create ]
    resources :user_events, path: :events, only: [ :index ]
  end

  resources :events
end
