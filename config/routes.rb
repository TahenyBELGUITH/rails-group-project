Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "foods#index"
  resources :recipes, only: [:new, :create, :destroy, :index, :show]
  resources :foods, only: [:destroy, :index, :new, :create]
  resources :public_recipes, only: [:index, :show]
  resources :general_shopping_list, only: [:index]
  resources :recipes, only: [:index] do
    resources :recipe_foods, only: [ :new, :create, :destroy, :index]
  end
end
