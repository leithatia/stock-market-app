class RemoveNameFromStocks < ActiveRecord::Migration[7.0]
  def change
    remove_column :stocks, :name
  end
end
