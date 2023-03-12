# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :description, presence: true

  has_one_attached :image

  def image_as_thumbnails
    image.variant(resize_to_fill: [450, 300]).processed
  end

  def image_as_thumbnail
    image.variant(resize_to_fill: [600, 700]).processed
  end
end
