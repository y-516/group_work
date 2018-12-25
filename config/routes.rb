Rails.application.routes.draw do

  root 'tops#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :blogs, except: [:index]

  resources :tops, only: [:index]

end
