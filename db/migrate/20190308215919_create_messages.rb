class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :project, foreign_key: { to_table: :projects }
      t.references :creator, foreign_key: { to_table: :users }
      t.text :msg

      t.timestamps
    end
  end
end
