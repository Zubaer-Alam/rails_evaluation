Rails.application.routes.draw do
  get 'brands/index'
  get 'categories/index'
  get 'products/index'

  resources :brands
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#homepage"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "homepage" => 'home#homepage'
  get "dashboard" =>'home#dashboard'
  # Defines the root path route ("/")
  # root "posts#index"
end
