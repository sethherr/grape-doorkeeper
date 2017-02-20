Rails.application.routes.draw do
  use_doorkeeper
  mount API::Base => '/api'
  resources :documentation, only: [:index] do
    collection do
      get :api_v1
      get :o2c
      get :authorize
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'landing#index'
end
