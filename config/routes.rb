Rails.application.routes.draw do
  resources :expenses, only: [:index, :show, :create, :update, :destroy]
  
  
  post '/users/regisert', to: 'users#register'
  post '/users/login', to: 'users#login'

  end
  