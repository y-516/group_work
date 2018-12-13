Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :users


  get 'tops/index'


end
