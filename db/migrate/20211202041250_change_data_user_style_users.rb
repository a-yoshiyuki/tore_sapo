class ChangeDataUserStyleUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :user_style, :integer, default: 0, null: false
  end
end
