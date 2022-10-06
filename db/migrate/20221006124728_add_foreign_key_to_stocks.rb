class AddForeignKeyToStocks < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :stocks, :users
  end
end
