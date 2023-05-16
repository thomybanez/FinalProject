Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#home'
  get '/users', to: 'users#home', as: 'users_home'


  get '/performers', to: 'performers#home', as: 'performers_home'
  get '/performers/login', to: 'performers#login', as: 'performers_login'
  get '/performers/register', to: 'performers#register', as: 'performers_register'
  get '/performers/dashboard', to: 'performers#dashboard', as: 'performers_dashboard'
  get '/performers/logout', to: 'performers#logout', as: 'performers_logout'

  get '/clients', to: 'clients#home', as: 'clients_home'
  get '/clients/login', to: 'clients#login', as: 'clients_login'
  get '/clients/register', to: 'clients#register', as: 'clients_register'
  get '/clients/dashboard', to: 'clients#dashboard', as: 'clients_dashboard'
  get '/clients/show/:id', to: 'clients#show', as: 'clients_show'
  get '/clients/logout', to: 'clients#logout', as: 'clients_logout'
  get '/clients/edit', to: 'clients#edit', as: 'clients_edit'
  

  get '/bookings', to: 'bookings#new', as: 'bookings_new'

  post '/performers', to: 'performers#create', as: 'performers_create'
  post '/performers/login/submit', to: 'performers#login_submit', as: 'performers_login_submit'

  post '/clients', to: 'clients#create', as: 'clients_create'
  post '/clients/login/submit', to: 'clients#login_submit', as: 'clients_login_submit'
  post '/clients/update', to: 'clients#update', as: 'clients_update'

  
  
  


  

  

end
