require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users

  root "landing#index"

  resources :documentation, only: [:index] do
    collection do
      get :api_v1
      get :o2c
      get :authorize
    end
  end

  # Authenticate sidekiq interface - probably update to verify users are admins or something: https://github.com/mperham/sidekiq/wiki/Monitoring
  authenticate :user do
    mount Sidekiq::Web, at: "/sidekiq"
  end

  # Grape API - must be below routes so it doesn't override
  mount API::Base => "/api"
end
