Rails.application.routes.draw do
  resources :bill_records
  resources :task_records
  resources :bills
  resources :appliances
  resources :tasks
  get 'static_pages/home'
  get 'static_pages/appliance'
  get 'static_pages/bill'
  get 'static_pages/setting'
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  resources :houses
  resources :users
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
