Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"


end
