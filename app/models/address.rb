class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :prefecture_id, :city, :block ,presence: true
  validates :apartment, presence: true, allow_blank: true
  
  VALID_POSTAL_CODE = /\A\d{3}-\d{4}\z/i
  validates :postal_code, {presence: true, format: { with: VALID_POSTAL_CODE }}


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
