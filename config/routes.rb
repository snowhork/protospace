Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes do
    resources :likes, only: :create
  end
  resources :users, only: [:show, :edit, :update]
end
