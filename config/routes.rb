Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get '/bill', to: 'static_pages#bill'
  get '/appliance', to: 'static_pages#appliance'
  get '/setting', to: 'static_pages#setting'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  resources :houses
  resources :users
end
