Rails.application.routes.draw do
  resources :expenses, only: [:index, :show, :create, :update, :destroy]
  
  
  post '/users/register', to: 'users#register'
  post '/users/login', to: 'users#login'
  get '/users', to: 'users#index'        # to get all users
  get '/users/:id', to: 'users#show'     # to get a user by ID
  end
  