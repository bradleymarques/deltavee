Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions" }

  get "dashboard", to: "dashboards#show"
  get "map", to: "maps#show"

  get "about", to: "pages#about"
  get "home", to: "pages#home"

  resources :systems, only: [:show]
  resources :users, only: [:show]

  root to: "pages#home"
end
