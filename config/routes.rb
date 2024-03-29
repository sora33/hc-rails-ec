# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'products#index'
  resources :products, only: %i[index show]
  resource :cart, only:  %i[show]
  resources :cart_items, only: %i[create destroy]
  resources :orders, only: %i[index create show]
  post 'apply_promo_code', to: 'carts#apply_promo_code'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
