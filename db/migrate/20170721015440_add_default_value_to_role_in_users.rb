class AddDefaultValueToRoleInUsers < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :role, :integer, default: 0
  end

  def down
    change_column :users, :role, :integer
  end
end
