Rails.application.routes.draw do

  root 'welcome#home'
  get '/signin', to: 'sessions#sign_in'

  resources :users



end
