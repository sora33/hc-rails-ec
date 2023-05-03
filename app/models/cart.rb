# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  has_one :order, dependent: :nullify
  belongs_to :promotion_code, optional: true
end
