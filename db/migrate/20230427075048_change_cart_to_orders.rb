# frozen_string_literal: true

class ChangeCartToOrders < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :orders, :carts
  end
end
