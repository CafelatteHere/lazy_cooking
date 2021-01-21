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
  resources :calendars do
    collection do
      get 'search'
      delete 'destroy_all'
    end
  end
end
