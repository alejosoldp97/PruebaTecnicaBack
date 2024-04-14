Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'

  namespace :api do
    namespace :v1 do
      resources :earthquakes do
        post :update_data, on: :collection
      end
      resources :comments
    end
  end
end
