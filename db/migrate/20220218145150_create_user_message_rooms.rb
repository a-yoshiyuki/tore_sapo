class CreateUserMessageRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :user_message_rooms do |t|
      t.references :message_room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :participant_user, null: false, foreign_key: { to_table: :users }
      t.text :last_message_content
      t.datetime :last_message_updated_at

      t.timestamps
    end
  end
end
