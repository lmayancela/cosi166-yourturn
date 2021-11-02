Rails.application.routes.draw do
  get 'sessions/new'
  resources :bill_records
  resources :task_records
  resources :bills
  resources :appliances
  resources :tasks
  resources :users
  resources :houses
  get 'users/new'
  root 'static_pages#home'
  get '/billing', to: 'static_pages#billing'
  get '/house_appliance', to: 'static_pages#house_appliance'
  get '/setting', to: 'static_pages#setting'
  get '/contact', to: 'static_pages#contact'
  # routes for sign up and login
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
