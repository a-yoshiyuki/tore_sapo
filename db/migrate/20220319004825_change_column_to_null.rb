class ChangeColumnToNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :user_message_rooms, :last_message_updated_at, true
  end

  def down
    change_column_null :user_message_rooms, :last_message_updated_at, false
  end
end
