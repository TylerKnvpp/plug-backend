Rails.application.routes.draw do

  get '/user_profile', to: 'auth#user_profile'
  post '/login', to: 'auth#login'

  resources :users, only: [:index, :show, :create, :update]
  resources :invites, only: [:index, :show, :create, :update]
  resources :plans, only: [:index, :show, :create, :update]
end
