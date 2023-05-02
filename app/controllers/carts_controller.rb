# frozen_string_literal: true

class CartsController < ApplicationController
  def show; end

  def apply_promo_code
    promo_code = PromotionCode.find_by(code: params[:code])
    if promo_code.blank? || promo_code.is_used
      redirect_to cart_path, alert: '無効なプロモーションコードです。'
      return
    end

    @cart.promotion_code = promo_code
    if @cart.save
      redirect_to cart_path, notice: 'プロモーションコードが適用されました。'
    else
      redirect_to cart_path, alert: 'プロモーションコードの適用に失敗しました。再度お試しください。'
    end
  end
end
