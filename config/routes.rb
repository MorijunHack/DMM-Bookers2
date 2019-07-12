Rails.application.routes.draw do
  get 'books/show'
  get 'books/edit'
  get 'books/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  get 'home/top'
  get 'home/about'
  get 'home/after_login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'

  resources :books, only: [:create, :show, :index, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :index]
end
