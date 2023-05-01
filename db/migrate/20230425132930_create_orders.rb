# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :cart, null: false, foreign_key: true
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :email, null: false
      t.string :postal_code, null: false
      t.string :address1, null: false
      t.string :address2
      t.string :card_name, null: false
      t.string :card_number, null: false
      t.string :card_expire, null: false
      t.string :card_cvv, null: false
      t.timestamps
    end
  end
end
