class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postal_code, :prefecture_id, :city, :block, :apartment ,presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
