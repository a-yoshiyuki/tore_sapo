class UserMessageRoom < ApplicationRecord
  belongs_to :message_room
  belongs_to :user
  belongs_to :participant_user, class_name: 'User'

  validates :message_room_id, uniqueness: { scope: :user_id }
end
