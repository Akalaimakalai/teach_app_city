# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'citizens#index'

  resources :citizens, only: %i[index]
end
