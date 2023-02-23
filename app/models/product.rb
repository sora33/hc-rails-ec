# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :description, presence: true

  has_many_attached :images
end
