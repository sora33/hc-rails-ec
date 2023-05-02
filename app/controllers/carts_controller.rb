# frozen_string_literal: true

class CartsController < ApplicationController
  def show; end

  def apply_promo_code
    promo_code = PromotionCode.find_by(code: params[:code])
    if promo_code.present? && !promo_code.is_used
      @cart.promotion_code = promo_code
      @cart.save
      redirect_to cart_path, notice: 'プロモーションコードが適用されました。'
    else
      redirect_to cart_path, alert: '無効なプロモーションコードです。'
    end
  end
end
