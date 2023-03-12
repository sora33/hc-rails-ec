# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products' do
  describe 'GET /index' do
    it 'returns http success' do
      # テスト
      get '/products'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      # テストデータを作成
      product = Product.new(
        name: 'テスト商品名',
        description: 'とってもおいしいです',
        price: rand(500..1500)
      )
      product.image.attach(io: File.open(Rails.root.join('app/assets/images/sora.jpg')), filename: 'sora.jpg')
      product.save!
      # テスト
      get "/products/#{product.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
