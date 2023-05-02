# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy

  # カート情報から注文商品情報（order_items_from_cart）を作成
  def self.order_items_from_cart(cart)
    cart.cart_items.map do |cart_item|
      OrderItem.new(
        product_name: cart_item.product.name,
        price: cart_item.product.price,
        quantity: cart_item.quantity
      )
    end
  end

  # オーダー作成とメール送信
  def create_order_with_items(cart)
    self.order_items = Order.order_items_from_cart(cart)
    use_promotion_code(cart)
    save!
    OrderMailer.order_confirmation(self).deliver_now
  end

  # プロモーションコードの使用
  def use_promotion_code(cart)
    self.discount = cart.promotion_code&.discount || 0
    cart.promotion_code&.update(is_used: true)
  end

end
