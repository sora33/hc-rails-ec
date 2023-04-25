# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    # デフォルトで１にする
    quantity = params[:quantity] || 1
    # カートに商品があれば既存データ、なければ新規作成
    cart_item = @cart.cart_items.find_or_initialize_by(product_id: product.id)
    cart_item.quantity += quantity.to_i
    cart_item.save!

    redirect_to request.referer, notice: "#{product.name}を#{quantity}つカートに追加しました。"
  end

  def destroy
    cart_item = @cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_path, notice: 'カートから商品を削除しました。'
  end
end
