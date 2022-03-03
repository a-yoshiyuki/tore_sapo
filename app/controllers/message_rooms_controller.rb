class MessageRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_message_rooms = UserMessageRoom.all
  end

  def create
    participant_user = params[:participant_user_id]
    current_user = params[:current_user_id]
    message_room = UserMessageRoom.find_by(user_id: current_user.id, participant_user_id: participant_user.id)&.message_room

    if message_room
      redirect_to message_room_path(message_room_id: @message_room.id)
    else
      message_room = MessageRoom.create
      redirect_to message_room_path(message_room_id: @message_room.id)
    end
  end

  def show
    @message_room = MessageRoom.find(params[:id])
  end
end
