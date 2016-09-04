Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  scope :prototypes do
    resources :popular, only: [:index]
  end
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  resources :tags, only: [:index, :show]
end
