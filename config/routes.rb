Rails.application.routes.draw do
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
