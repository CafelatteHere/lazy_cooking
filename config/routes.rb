Rails.application.routes.draw do
  get 'calendars/index'
  devise_for :users
  get 'recipes/index'
  root to: "recipes#index"
  resources :recipes
end
