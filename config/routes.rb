Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#home'
  get '/users', to: 'users#home', as: 'users_home'


  get '/entertainers', to: 'entertainers#home', as: 'entertainers_home'
  get '/entertainers/login', to: 'entertainers#login', as: 'entertainers_login'
  get '/entertainers/register', to: 'entertainers#register', as: 'entertainers_register'
  get '/entertainers/dashboard', to: 'entertainers#dashboard', as: 'entertainers_dashboard'

  get '/clients', to: 'clients#home', as: 'clients_home'
  get '/clients/login', to: 'clients#login', as: 'clients_login'
  get '/clients/register', to: 'clients#register', as: 'clients_register'
  get '/clients/dashboard', to: 'clients#dashboard', as: 'clients_dashboard'
  


end
