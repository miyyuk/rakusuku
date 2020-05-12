Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users
  resources :groups do
    resources :posts do
      resource :looks, only: [:create, :destroy]
      resources :comments, only: :create
    end
  end
end
