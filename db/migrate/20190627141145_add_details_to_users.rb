class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday, :date
    add_column :users, :location, :text
    add_column :users, :username, :string
  end
end
