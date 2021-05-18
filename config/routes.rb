Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions" }

  get "dashboard", to: "dashboards#show"
  get "map", to: "maps#show"

  get "about", to: "pages#about"
  get "home", to: "pages#home"

  get "notifications/inbox", to: "notifications#inbox", as: "inbox"
  get "notifications/outbox", to: "notifications#outbox", as: "outbox"
  resources :notifications, only: [:show, :new, :create]
  resources :systems, only: [:show]
  resources :users, only: [:show]

  resources :universe_maps, only: [:index]
  resources :system_maps, only: [:index]

  resources :fleets, only: [:index, :show]

  root to: "pages#home"
end
