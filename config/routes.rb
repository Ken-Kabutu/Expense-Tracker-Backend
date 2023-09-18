Rails.application.routes.draw do
  resources :incomes
  resources :expenses, only: %i[index show create update destroy]
  resources :users
  # post '/register', to: 'users#create'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  get '/me', to: 'users#show'
end
