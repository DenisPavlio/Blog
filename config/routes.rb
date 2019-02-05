Rails.application.routes.draw do
  resources :posts
  resources :comments, only: [:create, :destroy]
  devise_for :users
  root to: 'posts#index'

  match :like, to: 'likes#create', as: :like, via: :post
  match :unlike, to: 'likes#destroy', as: :unlike, via: :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
