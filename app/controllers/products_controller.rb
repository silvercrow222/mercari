class ProductsController < ApplicationController

  # before_action :move_to_index, except: [:index, :show]
  before_action :ensure_current_user, only: [:edit, :update, :destroy]
  before_action :set_product, only: [:imageEdit, :imageUpdate, :edit, :update, :destroy, :show]

  def index
    @products = Product.includes(:images).order('created_at DESC')
    @items = Product.where(buyer_id: nil).includes(:images).order('created_at DESC')
    @brand = Product.where(buyer_id: nil, brand_id: 0).includes(:images).order('created_at DESC')
  end

  def show
    @grandchild = Category.find(@product.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
    @images = @product.images
  end
  
  def new
    if user_signed_in?
      @product = Product.new
      @product.images.new
      @category = Category.all.order("id ASC").limit(13)
      @length = 0
    else
      redirect_to new_user_session_path
    end
  end
  
  def create
    @product = Product.new(product_params)
    @category = Category.all.order("id ASC").limit(13)
    if @product.images.present?
      if @product.price >= 300 && @product.price <= 9999999
        @product.save
        redirect_to root_path
      else 
        flash[:alert] = '価格は300円から9999999円までです'
        render :new
      end
    else
      flash[:alert] = '画像を選択してください'
      redirect_to new_product_path
    end
  end

  def imageEdit
    @length = @product.images.length
    @checks = []
  end

  def imageUpdate
    boxcheck = params[:boxcheck]
    if @product.update(product_params)
      redirect_to edit_product_path(params[:id], boxcheck: boxcheck), notice: '更新されました'
    else
      render :imageEdit
    end
  end

  def edit
    @category = Category.all.order("id ASC").limit(13)
    @length = @product.images.length
    @boxcheck = params[:boxcheck]
  end
    
  def category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:productcategory]).children 
  end

 # 子カテゴリーが選択された後に動くアクション
  def category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    # @category_grandchildren = Category.find("#{params[:child_id]}").children
    @category_grandchildren = Category.find(params[:productcategory]).children
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(params[:id]), notice: '更新されました'
    else
      render :edit
    end
  end
  
  def destroy
    if @product.destroy
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
    params.require(:product).permit(:name, :detail, :condition, :size, :day, :shipping, :fee, :category_id, :parent_name, :child_id, :brand_id, :prefecture_id, :buyer_id, :price, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
  # def move_to_index
  #   redirecto_to action: :index unless user_signed_in?
  # end
end
