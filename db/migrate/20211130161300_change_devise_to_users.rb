class ChangeDeviseToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_columns :users, :last_name, :first_name, :last_name_kana, :first_name_kana
    add_column :users, :name, :string
  end
end
