Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update]
  resources :invites, only: [:index, :show, :create, :update]
  resources :plans, only: [:index, :show, :create, :update]
end
