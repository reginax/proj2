Rails.application.routes.draw do

  root to: 'home#index'
  devise_for :farmers
  resources :farmers
  patch "harvest", to: "plants#harvest"
  post "plants", to: "plants#create"
  get "plants/new", to: "plants#new"
end
