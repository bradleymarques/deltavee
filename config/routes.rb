Rails.application.routes.draw do
  devise_for :users

  get "dashboard", to: "dashboards#show"
  get "map", to: "maps#show"

  get "about", to: "pages#about"
  get "home", to: "pages#home"

  get "system_data", to: "system_data#index"

  root to: "pages#home"
end
