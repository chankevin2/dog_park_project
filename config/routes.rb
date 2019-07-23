Rails.application.routes.draw do
  root 'parks#index'
  devise_for :users
  resources :parks, only: [:index, :new, :create, :show]do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy, :show]
  end


  namespace :api do
    namespace :v1 do
      resources :parks, only: [:index, :show]
      resources :reviews, only: [:index, :new, :create]
    end
  end
end
