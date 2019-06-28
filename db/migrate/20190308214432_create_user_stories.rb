class CreateUserStories < ActiveRecord::Migration[5.2]
  def change
    create_table :user_stories do |t|
      t.references :project, foreign_key: { to_table: :projects }
      t.references :creator, foreign_key: { to_table: :users }
      t.references :worker, foreign_key: { to_table: :users }, null: true
      t.string :title
      t.text :description
      t.date :deadline
      t.integer :state

      t.timestamps
    end
  end
end
