class MessageRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_message_rooms = UserMessageRoom.all
  end

  def create

    if message_room.blank?
      message_room = MessageRoom.create
      UserMessageRoom.create(message_room: message_room, user_id: current_user.id)
      UserMessageRoom.create(message_room: message_room, user_id: participant_user.id)
    end
  end

  def show
    @message_room = MessageRoom.find(params[:id])
  end
end
