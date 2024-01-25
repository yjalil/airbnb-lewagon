Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", :as => :dashboard
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/hrayfya", to: "pages#hrayfya"
  get '/hrayfya(/:id)', to: 'jobs#details'
  get '/hrayfya(/:id/)new', to: 'jobs#new', :as => :make_reservation
  post '/hrayfya/create', to: 'jobs#create', :as => :validate_reservation
end
