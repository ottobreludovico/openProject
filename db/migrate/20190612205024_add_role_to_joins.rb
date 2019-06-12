class AddRoleToJoins < ActiveRecord::Migration[5.2]
  def change
    add_column :joins, :role, :string
  end
end
