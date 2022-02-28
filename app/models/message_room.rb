class MessageRoom < ApplicationRecord
  has_many :user_message_rooms
  has_many :messages
end
