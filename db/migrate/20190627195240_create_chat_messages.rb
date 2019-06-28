class CreateChatMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_messages do |t|
    	t.references :project, foreign_key: { to_table: :projects }
    	t.references :user, foreign_key: { to_table: :users }
    	t.text :body
      t.timestamps
    end
  end
end
