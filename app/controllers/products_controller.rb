# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  # Rails.logger.debug "うううううううaaうううううaaうう"
  def index
    @products = Product.all
  end

  def random
    @products = Product.all.sample(6)
  end

  def show
    @products = Product.all.sample(6)
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "#{@product.name}を登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if params[:product][:image_ids].present?
      params[:product][:image_ids].each do |image_id|
        image = @product.images.find_by(id: image_id)
        image.purge if image.present?
      end
    end
    @product.update(product_params)
    redirect_to @product, notice: "#{@product.name}を更新しました"
  end

  def destroy
    @product.destroy
    redirect_to root_url, notice: "#{@product.name}を削除しました"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, images: [])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
