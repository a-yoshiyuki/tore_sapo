class AddDetailsToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :message_room, null: false, foreign_key: true
    add_reference :messages, :user, null: false, foreign_key: true
    add_column :messages, :content, :text
  end
end
