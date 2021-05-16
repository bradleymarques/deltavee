Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions" }

  get "dashboard", to: "dashboards#show"
  get "map", to: "maps#show"

  get "about", to: "pages#about"
  get "home", to: "pages#home"

  get "system_data", to: "system_data#index"

  get "notifications/inbox", to: "notifications#inbox", as: "inbox"
  get "notifications/outbox", to: "notifications#outbox", as: "outbox"
  resources :notifications, only: [:show, :new, :create]

  root to: "pages#home"
end
