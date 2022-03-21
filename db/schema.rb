# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_19_004825) do

  create_table "message_rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "message_room_id", null: false
    t.bigint "user_id", null: false
    t.bigint "participant_user_id", null: false
    t.text "content"
    t.index ["message_room_id"], name: "index_messages_on_message_room_id"
    t.index ["participant_user_id"], name: "index_messages_on_participant_user_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "follower_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
    t.index ["user_id", "follower_id"], name: "index_relationships_on_user_id_and_follower_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "user_message_rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "message_room_id", null: false
    t.bigint "user_id", null: false
    t.bigint "participant_user_id", null: false
    t.text "last_message_content"
    t.datetime "last_message_updated_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_room_id"], name: "index_user_message_rooms_on_message_room_id"
    t.index ["participant_user_id"], name: "index_user_message_rooms_on_participant_user_id"
    t.index ["user_id"], name: "index_user_message_rooms_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "image"
    t.text "self_introduction"
    t.integer "user_style", default: 0, null: false
    t.text "career"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "message_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "follower_id"
  add_foreign_key "user_message_rooms", "message_rooms"
  add_foreign_key "user_message_rooms", "users"
  add_foreign_key "user_message_rooms", "users", column: "participant_user_id"
end
