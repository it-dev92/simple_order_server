Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :orders, only: %i[index new create edit update]

  root to: 'orders#index'
end
