class ProductsController < ApplicationController
  before_action :ensure_current_user, only: [:edit, :update, :destroy]
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end
  def edit
  end
  def update
    if @product.update(product_params)
      redirect_to products_path, notice: '更新されました'
    else
      redirect_to edit_product_path(@product)
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
  def ensure_current_user
    product = Product.find(params[:id])
    if product.user_id != current_user.id
      flash[:notice] = "no authorization"
      redirect_to action: :index
    end
  end
  def product_params
    #params.require(:product).permit(:user_id, :name, :price, :category_id, :bland_id, :detail, :condition, :size, :days, :method, :fee, images_attributes: [:id, :product_id, :product_image]).merge(user_id: current_user.id)
    params.require(:product).permit(:name).merge(user_id: current_user.id)
  end
  def set_product
    @product = Product.find(params[:id])
  end
end
