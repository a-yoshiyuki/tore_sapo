class Message < ApplicationRecord
  belongs_to :user
  belongs_to :participant_user
  belongs_to :message_room
end
