class UpdateStocksTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :stocks, :ticker, :symbol
    change_column_null :stocks, :symbol, false

    add_column :stocks, :name, :string, null: false
  end
end
