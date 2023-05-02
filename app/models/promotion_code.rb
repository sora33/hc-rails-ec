class PromotionCode < ApplicationRecord
  has_one :cart
  validates :code, presence: true, uniqueness: true, length: { is: 7 }
  validates :discount, presence: true, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 1000 }
  validates :is_used, inclusion: { in: [true, false] }
end
