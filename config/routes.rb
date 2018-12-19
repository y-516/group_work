Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :blogs

  get 'tops/index'


end
