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
      product = Product.create(name: 'テスト商品名', description: 'とってもおいしいです', price: rand(500..1500))
      get "/products/#{product.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
