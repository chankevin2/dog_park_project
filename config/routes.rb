Rails.application.routes.draw do
  root 'parks#index'
  devise_for :users
  resources :parks, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
