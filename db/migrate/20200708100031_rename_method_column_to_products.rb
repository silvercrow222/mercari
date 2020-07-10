class RenameMethodColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :method, :shipping
  end
end
