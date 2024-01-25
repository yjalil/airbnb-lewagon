Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", :as => :dashboard
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/hrayfya", to: "pages#hrayfya"
  get '/hrayfya(/:id)', to: 'jobs#details', :as => :details
  get '/hrayfya(/:id/)new', to: 'jobs#new', :as => :make_reservation
  post '/hrayfya/create', to: 'jobs#create', :as => :validate_reservation
  post '/job/:job_id/accept', to: 'jobs#accept', :as => :accept
  post '/job/:job_id/refuse', to: 'jobs#refuse', :as => :refuse
  post '/job/:job_id/finish', to: 'jobs#finish', :as => :finish

end
