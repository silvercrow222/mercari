class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.integer :price, index: true
      t.text :detail, null:false
      t.integer :fee, null:false
      t.integer :condition
      t.integer :days
      t.integer :size
      t.integer :method
      t.integer :brand_id
      t.integer :category_id
      t.integer :prefecture_id
      t.references :user ,index: true, foreign_key: true
      t.timestamps
    end
  end
end
