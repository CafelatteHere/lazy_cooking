Rails.application.routes.draw do
  devise_for :users
  get 'recipes/index'
  root "recipes#index"
  resources :recipes
end
