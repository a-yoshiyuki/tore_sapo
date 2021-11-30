class ChangeDeviseNameDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :name, :string, default: "", null: false
  end
end
