# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order
    mail to: @order.email, subject: '注文確認', from: ENV['EMAIL_ADDRESS']
  end
end
