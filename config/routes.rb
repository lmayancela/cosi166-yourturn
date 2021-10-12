Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/appliance'
  get 'static_pages/bill'
  get 'static_pages/setting'
  resources :houses
  resources :users
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
