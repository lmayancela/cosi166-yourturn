Rails.application.routes.draw do
  resources :bill_records
  resources :task_records
  resources :bills
  resources :appliances
  resources :tasks
  resources :users
  get 'users/new'
  root 'static_pages#home'
  get '/billing', to: 'static_pages#billing'
  get '/house_appliance', to: 'static_pages#house_appliance'
  get '/setting', to: 'static_pages#setting'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'display/:date/:ids', to: 'static_pages#display', as: 'display'
  resources :houses
  resources :users
end
