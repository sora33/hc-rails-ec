# frozen_string_literal: true

class RemoveCartIdFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :cart_id, :bigint
  end
end
