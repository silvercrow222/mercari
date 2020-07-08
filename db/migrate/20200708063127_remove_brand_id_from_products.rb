class RemoveBrandIdFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :brand_id, :text
    remove_column :products, :detail, :integer

  end
end
