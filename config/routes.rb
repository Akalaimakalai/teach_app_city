# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper

  root to: 'citizens#index'

  devise_for :users

  resources :citizens, except: :show

  namespace :api do
    namespace :v1 do
      resources :profiles, only: [] do
        get :me, on: :collection
      end
    end
  end
end
