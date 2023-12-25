# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'brands/index'
  # get 'categories/index'
  # get 'products/index'
  root 'home#homepage'
  #
  devise_for :users

  resources :brands
  resources :products
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'homepage' => 'home#homepage'
  get 'dashboard' => 'home#dashboard'
  # Defines the root path route ("/")
  # root "posts#index"
end
