class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :detail
      t.integer :price
      t.integer :condition
      t.integer :size
      t.integer :day
      t.integer :method
      t.integer :fee
      t.integer :brand_id
      t.integer :prefecture_id
      t.integer :buyer_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
