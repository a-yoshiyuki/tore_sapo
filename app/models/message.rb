class Message < ApplicationRecord
  belongs_to :user
  belongs_to :message_room
  belongs_to :participant_user, class_name: 'User'
end
