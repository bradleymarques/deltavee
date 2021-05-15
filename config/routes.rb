Rails.application.routes.draw do
  devise_for :users

  get "dashboard", to: "dashboards#show"
  get "map", to: "maps#show"

  resources :systems, only: [:index]

  get "about", to: "pages#about"
  get "home", to: "pages#home"

  root to: "pages#home"
end
