class CreateUserMessageRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :user_message_rooms do |t|

      t.timestamps
    end
  end
end
