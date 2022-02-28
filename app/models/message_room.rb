class MessageRoom < ApplicationRecord
  has_many :user_message_rooms
  has_many :messages
  has_many :users, through: :user_message_rooms
  has_many :participant_users, through: :user_message_rooms
end
