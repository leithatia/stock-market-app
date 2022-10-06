class ChangeIndexInStocks < ActiveRecord::Migration[7.0]
  def change
    change_column :stocks, :user_id, :bigint
    change_column_null :stocks, :user_id, false
  end
end
