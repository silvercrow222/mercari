class ProductsController < ApplicationController
  # before_action :ensure_current_user, only: [:new, :create, :destroy]
  before_action :set_product, only: :destroy

  def index
    @products = Product.all
  end

  def new
    # if user_signed_in?
      @product = Product.new
      @product.images.new
    # else
    #   redirect_to root_path
    # end
  end

  def create
    # binding.pry
    @product = Product.new(product_params)
    if @product.images.present?
      @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @product.delete
      redirect_to products_path, notice: '削除されました'
    else 
      render :index
    end
  end

  def purchase
    @product_buyer= Product.find(params[:id])
    @product_buyer.update( buyer_id: current_user.id, status: "購入済み")
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :detail, :fee, :condition, :day, :size, :method, :brand_id, :prefecture_id, :user_id, :category_id, :status, images_attributes: [:product_image,:_destroy,:id])
  end

  # def ensure_current_user
  #   product = Product.find(params[:id])
  #   if product.user_id != current_user.id
  #     flash[:notice] = "no authorization"
  #     redirect_to action: :index
  #   end
  # end

  def set_product
    @product = Product.find(params[:id])
  end
end
