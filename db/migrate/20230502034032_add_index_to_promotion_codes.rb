# frozen_string_literal: true

class AddIndexToPromotionCodes < ActiveRecord::Migration[7.0]
  def change
    add_index :promotion_codes, :code, unique: true
  end
end
