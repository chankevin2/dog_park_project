Rails.application.routes.draw do
  root 'parks#index'
  devise_for :users
  resources :parks, only: [:index, :new, :create, :show]

  namespace :api do
    namespace :v1 do
      resources :parks, only: [:index, :show]
    end
  end
end
