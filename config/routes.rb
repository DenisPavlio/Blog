Rails.application.routes.draw do
  resources :posts
  resources :categories
  resources :comments, only: [:create, :destroy]
  devise_for :users
  root to: 'posts#index'

  match :like, to: 'likes#create', as: :like, via: :post
  match :unlike, to: 'likes#destroy', as: :unlike, via: :post
end
