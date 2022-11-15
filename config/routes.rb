# frozen_string_literal: true

Rails.application.routes.draw do
  get 'public_recipes/index'
  get 'public_recipes/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"
  resources :users do
    resources :recipes
  end
  resources :foods, only: %i[index new create destroy]
  resources :public_recipes, only: %i[index show]

end
