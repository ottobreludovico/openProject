class CreateJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :joins do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :project, foreign_key: { to_table: :projects }

      t.timestamps
    end
  end
end
