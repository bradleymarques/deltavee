Rails.application.routes.draw do
  devise_for :users

  get "dashboard", to: "dashboards#show"

  get "about", to: "pages#about"
  get "home", to: "pages#home"

  root to: "pages#home"
end
