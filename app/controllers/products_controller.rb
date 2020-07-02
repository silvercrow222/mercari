class ProductsController < ApplicationController
  before_action :ensure_corrent_user, only: :destroy

  def index
    @products = Product.all
  end
  def destroy
    product = Product.find(params[:id])
    product.delete
  end

  private
  def ensure_corrent_user
    product = Product.find(params[:id])
    product.user_id != current_user.id
    flash[:notice] = "no authorization"
    redirect_to action: :index
  end
end
