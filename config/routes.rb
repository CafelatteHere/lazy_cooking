Rails.application.routes.draw do
  # get 'calendars/index'
  devise_for :users
  get 'recipes/index'
  root to: "recipes#index"
  resources :recipes do
    collection do
      get 'search'
    end
  end
  resources :calendars, only: [:index, :new, :create] do
    collection do
      get 'search'
    end
  end
end
