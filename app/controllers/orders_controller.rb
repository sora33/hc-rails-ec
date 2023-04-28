# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate, only: %i[index show]

  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def create
    @order = Order.new(order_params)
    Order.transaction do # start トランザクション処理
      if @cart.cart_items.present?
        create_order_and_send_confirmation(@order)
      else
        redirect_to cart_path, notice: '商品をカートに入れてください。'
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    redirect_to cart_path, notice: e.message
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.permit(:family_name, :given_name, :email, :postal_code, :address1, :address2,
                  :card_name, :card_number, :card_expire, :card_cvv)
  end

  # Basic認証
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'pw'
    end
  end

  # カート情報から注文商品情報（order_items_from_cart）を作成
  def order_items_from_cart(cart)
    cart.cart_items.map do |cart_item|
      OrderItem.new(
        product_name: cart_item.product.name,
        price: cart_item.product.price,
        quantity: cart_item.quantity
      )
    end
  end

  # オーダー作成とメール送信をトランザクション処理にする
  def create_order_and_send_confirmation(order)
    Order.transaction do
      order.order_items = order_items_from_cart(@cart)
      order.save!
      session[:cart_id] = nil
      set_cart
      OrderMailer.order_confirmation(order).deliver_now
    end
    redirect_to root_path, notice: 'ご購入ありがとうございました。'
  end
end
