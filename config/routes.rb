Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :farmers
  resources :farmers
  patch 'remove', to: 'plants#remove'
  get 'remove', to: 'plants#remove'
  patch 'harvest', to: 'plants#harvest'
  get 'harvest', to: 'plants#harvest'
  patch 'water', to: 'plants#water'
  get 'water', to: 'plants#water'
  get 'plants', to: 'plants#new'
  post 'plants', to: 'plants#create'
  get 'plants/new', to: 'plants#new'
  get '/show', to: 'store#show'
  patch 'buy', to: 'plants#buy'
  get 'buy', to: 'plants#buy'
  patch 'steal', to: 'plants#steal'
  get 'steal', to: 'plants#steal'
  patch 'squash', to: 'plants#squash'
  get 'squash', to: 'plants#squash'
  resources :plants

end
