class CreateUserMessageRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :user_message_rooms do |t|
      t.references :message_room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
