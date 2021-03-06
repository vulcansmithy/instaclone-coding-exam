Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end

  resources :profiles, only: [:index]
  get 'profiles/:username', to: 'profiles#show', as: :profile

  ##
  post "profiles/:username/add_friend",      to: "profiles#add_friend",      as: :profile_add_friend
  get  "profiles/:username/friend_requests", to: "profiles#friend_requests", as: :profile_friend_requests 

  post "profiles/friend_request_accept/:friendship_request_id",  to: "profiles#friend_request_accept",  as: :friend_request_accept
  post "profiles/friend_request_decline/:friendship_request_id", to: "profiles#friend_request_decline", as: :friend_request_decline
  ##

  resources :photos, only: [:index, :show, :new, :create, :destroy]

  resources :comments, only: [:create, :edit, :update, :destroy]

  root 'photos#index'

  get '*path', to: 'photos#index', constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }
end
