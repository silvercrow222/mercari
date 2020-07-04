class RenameDaysColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :days, :day
  end
end
