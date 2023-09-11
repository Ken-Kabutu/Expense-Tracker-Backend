Rails.application.routes.draw do
  resources :incomes
  resources :expenses, only: [:index, :show, :create, :update, :destroy]

  post "/users/register", to: "users#register"
  post "/users/login", to: "users#login"
  get "/users", to: "users#index"
  # More specific routes should be placed before the generic ones:
  get "/users/register", to: "users#new" # if you need a registration form route
  get "/users/:id", to: "users#show"
end
