Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Routes for home and about pages
  root "pages#home"
  get "about", to: "pages#about"

  # Routs for articles
  resources :articles

  # Routes for user signup
  get "signup", to: "users#new"
  resources :users, except: [:new]

  # Routes for login - logout
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
end
