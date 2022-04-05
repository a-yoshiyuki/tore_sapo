class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :message_room, null: false, foreign_key: true
      t.references :user, foreign_key: true, null:false
      t.text :content
      t.timestamps
    end
  end
end
