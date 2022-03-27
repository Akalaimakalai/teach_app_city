# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper

  root to: 'citizens#index'

  devise_for :users

  resources :citizens, except: :show
end
