Rails.application.routes.draw do

  resources :brands, only: [:new, :index, :create, :show, :destroy]

  resources :series, only: [:new, :index, :create]

  resources :books

  resources :users, only: [:new, :create]

  get '/dashboard', to: 'dashboard#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/collection', to: 'collection#index'
end
