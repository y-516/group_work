Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :blogs


  get 'tops/index'


end
