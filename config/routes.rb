Rails.application.routes.draw do
   devise_for :users 
  
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  
  root "foods#index"
  resources :recipes, only: [:new, :create, :destroy, :index, :show]
  resources :foods, only: [:destroy, :index, :new, :create]
  resources :public_recipes, only: [:index, :show]
  resources :general_shopping_list, only: [:index]
  resources :recipes, only: [:index] do
    resources :recipe_foods, only: [ :new, :create, :destroy, :index]
  end
end
