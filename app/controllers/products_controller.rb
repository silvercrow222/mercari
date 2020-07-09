class ProductsController < ApplicationController
  before_action :ensure_current_user, only: :destroy
  before_action :set_product, only: :destroy

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end
  
  def destroy
    if @product.delete
      redirect_to products_path, notice: '削除されました'
    else 
      render :index
    end
  end

  private
  def ensure_current_user
    product = Product.find(params[:id])
    if product.user_id != current_user.id
      flash[:notice] = "no authorization"
      redirect_to action: :index
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :detail, :condition, :size, :day, :shipping, :fee, :brand_id, :prefecture_id, :buyer_id, :price, images_attributes: [:src]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
