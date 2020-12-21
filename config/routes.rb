Rails.application.routes.draw do
  devise_for :users
  get 'recipes/index'
  root to: "recipes#index"
  resources :recipes do
    collection do
      get 'search'
    end
  end
end
