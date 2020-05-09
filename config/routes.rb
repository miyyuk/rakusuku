Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users
  resources :posts, only: [:index]
  resources :groups, only: [:index, :new, :create]
end
