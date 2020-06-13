Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:index, :show, :edit, :update]
  resources :groups, except: :show do
    resources :posts, only: [:index, :show, :create] do
      resource :looks, only: [:create, :destroy]
      resources :comments, only: :create
    end
  end
end
