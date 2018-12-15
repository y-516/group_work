Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
 

  get 'tops/index'

 
end
