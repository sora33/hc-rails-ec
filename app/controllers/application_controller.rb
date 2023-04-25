# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # セッションにカート IDを保存する
  before_action :set_cart

  private

  def set_cart
    # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
    @cart = Cart.find_by(id: session[:cart_id])
    # Cart情報が存在しない場合、@current_cartを作成
    @cart ||= Cart.create
    # 取得したCart情報よりIDを取得し、セッションに設定
    session[:cart_id] = @cart.id
  end
end
