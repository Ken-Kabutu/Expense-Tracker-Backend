Rails.application.routes.draw do
  resources :incomes, only: [:index, :show, :create, :update, :destroy]
  resources :expenses, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create] # Added index and show for users.

  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
end
