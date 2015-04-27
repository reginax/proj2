Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :farmers
  resources :farmers
  patch 'plot', to: 'plants#plot'
  get 'plot', to: 'plants#plot'
  patch 'harvest', to: 'plants#harvest'
  get 'harvest', to: 'plants#harvest'
  patch 'water', to: 'plants#water'
  get 'water', to: 'plants#water'
  get 'plants', to: 'plants#new'
  post 'plants', to: 'plants#create'
  get 'plants/new', to: 'plants#new'
  get '/show', to: 'store#show'
  patch'buy', to: 'plants#buy'
  get 'buy', to: 'plants#buy'

end
