Rails.application.routes.draw do
  root to: "pages#home"

  resources :events
  devise_for :users do
    resources :reviews
  end
  get "user/:id", to: "users#show", as: :user

  resources :users do
    resources :requests do
      member do
        post 'accept'
        post 'reject'
      end
    end
  end
end
