# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  resources :bill_records
  resources :task_records
  resources :bills
  resources :appliances
  resources :tasks
  resources :users
  resources :houses
  root 'static_pages#home'
  get '/billing', to: 'static_pages#billing'
  get '/house_appliance', to: 'static_pages#house_appliance'
  get '/setting', to: 'static_pages#setting'
  get '/contact', to: 'static_pages#contact'
  # routes for sign up and login
  get '/signup', to: 'users#new'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get 'billing_detail', to: 'static_pages#billing_detail'
  get 'display/:date/:ids', to: 'static_pages#display', as: 'display'
end
