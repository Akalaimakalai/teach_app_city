# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'citizens#index'

  use_doorkeeper

  devise_for :users

  resources :citizens, except: :show
end
