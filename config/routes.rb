Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :farmers
  resources :farmers
  patch 'plot', to: 'plants#plot'
  get 'plot', to: 'plants#plot'
  patch 'damage', to: 'plants#damage'
  get 'plants', to: 'plants#new'
  post 'plants', to: 'plants#create'
  get 'plants/new', to: 'plants#new'
end
