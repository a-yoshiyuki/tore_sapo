class UserMessageRoom < ApplicationRecord
  belongs_to :message_room
  belongs_to :user

  validates :message_room_id, uniqueness: { scope: :user_id }
end
