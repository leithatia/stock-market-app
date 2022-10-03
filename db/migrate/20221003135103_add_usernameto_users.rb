class AddUsernametoUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    change_column_null :users, :username, false
  end
end
