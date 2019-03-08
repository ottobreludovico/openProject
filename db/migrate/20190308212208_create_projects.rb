class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :teamleader, foreign_key: { to_table: :users }
      t.string :title
      t.text :description
      t.integer :number_of_member

      t.timestamps
    end
  end
end
