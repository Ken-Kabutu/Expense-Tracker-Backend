Rails.application.routes.draw do
  resources :expenses, only: [:index, :show, :create, :update, :destroy]
  
  post '/users/register', to: 'users#register'
  post '/users/login', to: 'users#login'
  delete '/users/logout', to: 'users#logout'
  get '/users/logged_in', to: 'users#logged_in_status'
  resources :users, only: [:index, :show]
end
