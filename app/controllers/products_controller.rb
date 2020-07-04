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
    @product = Product.new(product_params)
    if @product.images.present?
      @product.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    if @product.delete
      redirect_to products_path, notice: '削除されました'
    else 
      render :index
    end
  end

  private
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
