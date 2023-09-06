Rails.application.routes.draw do
  resources :incomes
  resources :expenses, only: [:index, :show, :create, :update, :destroy]

  post "/users/register", to: "users#register"
  post "/users/login", to: "users#login"
end
