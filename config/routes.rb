Rails.application.routes.draw do

  get '/user_profile', to: 'auth#user_profile'
  post '/login', to: 'auth#login'
  get '/invited_users', to: 'invites#invited_users'
  # post "/friends/reject" => "friends/reject"
  # post "/friends/remove" => "friends/remove"
  
  resources :users, only: [:index, :show, :create, :update] do
    resources :friends, only: [:index] do 
      post '/add-friend', to: 'friends#accept_friend_request'
    end
  end

  resources :friends, only: [:create]


  resources :invites, only: [:index, :show, :create, :update] do
    get '/invited_users', to: 'invites#invited_users'
  end
  
  resources :plans, only: [:index, :show, :create, :update]
end
