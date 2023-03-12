# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products' do
  describe 'GET /index' do
    it 'returns http success' do
      get '/products'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      product = Product.create!(name: 'test', price: 7777, description: 'test') # テストデータを作成
      get "/products/#{product.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/products/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      product = Product.create!(name: 'test', price: 7777, description: 'test') # テストデータを作成
      get "/products/#{product.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
