Rails.application.routes.draw do
  devise_for :users
  get 'home/top'
  get 'home/about'
  get 'home/after_login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
end
