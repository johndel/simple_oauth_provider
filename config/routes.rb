Rails.application.routes.draw do
  root to: 'users#show'
  use_doorkeeper
  # use_doorkeeper_openid_connect

  get 'authorize/:app_name/login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout' # I don't care, I want it to be a get not a deleteå
  post 'authenticate', to: 'sessions#create', as: 'authenticate'

  resources :users, only: [:index, :new, :create]
end
