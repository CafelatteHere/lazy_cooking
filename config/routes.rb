Rails.application.routes.draw do
  get 'recipes/index'
  root "recipes#index"
  resources :recipes
end
