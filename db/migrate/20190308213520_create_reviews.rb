class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :creator, foreign_key: { to_table: :users }
      t.references :assigned_to, foreign_key: { to_table: :users }
      t.references :project, foreign_key: { to_table: :projects }
      t.text :note
      t.integer :skills

      t.timestamps
    end
  end
end
