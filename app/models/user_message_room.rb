class UserMessageRoom < ApplicationRecord
  belongs_to :message_room
  belongs_to :user
  belongs_to :participant_user
end
