class AddAcceptedToJoins < ActiveRecord::Migration[5.2]
  def change
    add_column :joins, :accepted, :bool, :default => false
  end
end
