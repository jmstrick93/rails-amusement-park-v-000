Rails.application.routes.draw do

  root 'welcome#home'
  get '/signin', to: 'sessions#sign_in'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  resources :users



end
