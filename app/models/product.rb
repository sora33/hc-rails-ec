# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :description, presence: true

  has_one_attached :image

  def image_as_thumbnails
    return 'https://dummyimage.com/450x300/dee2e6/6c757d.jpg' unless image.attached?

    begin
      image.variant(resize_to_fill: [450, 300]).processed
    rescue ActiveStorage::FileNotFoundError => e
      Rails.logger.error "Error loading image: #{e}"
      # デフォルト画像を返す
      'https://dummyimage.com/450x300/dee2e6/6c757d.jpg'
    end

    # 画像が添付されていない場合はデフォルト画像を返す
  end

  def image_as_thumbnail
    return 'https://dummyimage.com/600x700/dee2e6/6c757d.jpg' unless image.attached?

    begin
      image.variant(resize_to_fill: [600, 700]).processed
    rescue ActiveStorage::FileNotFoundError => e
      Rails.logger.error "Error loading image: #{e}"
      # デフォルト画像を返す
      'https://dummyimage.com/600x700/dee2e6/6c757d.jpg'
    end

    # 画像が添付されていない場合はデフォルト画像を返す
  end
end
