# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'products#index'
  resources :products do
    collection do
      get 'random'
    end
  end
end
