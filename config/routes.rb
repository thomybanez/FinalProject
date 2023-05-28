Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Users#
  root 'users#home'
  get '/users', to: 'users#home', as: 'users_home'

  # Performers#
  get '/performers', to: 'performers#home', as: 'performers_home'
  get '/performers/login', to: 'performers#login', as: 'performers_login'
  get '/performers/register', to: 'performers#register', as: 'performers_register'
  get '/performers/dashboard/:id', to: 'performers#dashboard', as: 'performers_dashboard'
  get '/performers/show/:id', to: 'performers#show', as: 'performers_show'
  get '/performers/logout', to: 'performers#logout', as: 'performers_logout'
  get '/performers/edit/:id', to: 'performers#edit', as: 'performers_edit'

  # Clients#
  get '/clients', to: 'clients#home', as: 'clients_home'
  get '/clients/login', to: 'clients#login', as: 'clients_login'
  get '/clients/register', to: 'clients#register', as: 'clients_register'
  get '/clients/:id/dashboard', to: 'clients#dashboard', as: 'clients_dashboard'
  get '/clients/:id/show', to: 'clients#show', as: 'clients_show'
  get '/clients/logout', to: 'clients#logout', as: 'clients_logout'
  get '/clients/:id/edit', to: 'clients#edit', as: 'clients_edit'

  # Bookings#
  get '/bookings/show', to: 'bookings#show', as: 'bookings_show'
  get '/bookings/permission', to: 'bookings#permission', as: 'bookings_permission'
  post '/bookings/create/performer/:id', to: 'bookings#create', as: 'bookings_create'

  # Services#
  get '/services', to: 'services#show', as: 'services_show'
  get '/services/new', to: 'services#new', as: 'services_new'
  get '/services/:id/edit', to: 'services#edit', as: 'services_edit'
  delete '/services/:id/delete', to: 'services#delete', as: 'services_delete'

  post '/services', to: 'services#create', as: 'services_create'
  post '/services/:id/update', to: 'services#update', as: 'services_update'


  # Submit Performer Client#
  post '/performers', to: 'performers#create', as: 'performers_create'
  post '/performers/login/submit', to: 'performers#login_submit', as: 'performers_login_submit'
  post '/performers/update', to: 'performers#update', as: 'performers_update'

  post '/clients', to: 'clients#create', as: 'clients_create'
  post '/clients/login/submit', to: 'clients#login_submit', as: 'clients_login_submit'
  post '/clients/update', to: 'clients#update', as: 'clients_update'
end
