class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.string :last_name, null: false, default: ""
      t.string :first_name, null: false, default: ""
      t.string :last_name_kana, null: false, default: ""
      t.string :first_name_kana, null: false, default: ""
      t.string :image
      t.string :email, null: false, default: ""
      t.string :password, null: false, default: ""
      t.text :self_introduction
      t.boolean :user_style, null: false, default: true
      t.text :career

      t.timestamps
    end
  end
end
