class Product < ApplicationRecord
  belongs_to :user
  #belongs_to :brand
  #has_many :categories, through: :product_categories
  #has_many :product_categories
  #has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  #enum fee:{
  #  buyer: 0,
  #  seller: 1
  #}
end
