class ProductsController < ApplicationController
  before_action :ensure_corrent_user, only: :destroy
  before_action :set_product, only: :destroy

  def index
    @products = Product.all
  end
  def destroy
    if @product.delete
      redirect_to products_path, notice: '削除されました'
    else 
      render :index
    end
  end

  private
  def ensure_corrent_user
    product = Product.find(params[:id])
    if product.user_id != current_user.id
      flash[:notice] = "no authorization"
      redirect_to action: :index
    end
  end
  def set_product
    @product = Product.find(params[:id])
  end
end
