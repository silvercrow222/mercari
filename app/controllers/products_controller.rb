class ProductsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  
  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def edit
   @product = Product.find(params[:id])
  end

  def update
   product = Product.find(params[:id])
   product.update(product_params)
  end

  def destroy
   product = Product.find(params[:id])
   product.destroy
  end
  
  # def move_to_index
  #   redirecto_to action: :index unless user_signed_in?
  # end
end
