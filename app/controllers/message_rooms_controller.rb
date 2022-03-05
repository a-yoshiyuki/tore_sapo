class MessageRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_message_rooms = UserMessageRoom.all
  end

  def new
    @message = Message.new
  end

  def create
    participant_user = User.find(params[:participant_user_id])
    message_room = UserMessageRoom.find_by(user_id: current_user.id, participant_user_id: participant_user.id)&.message_room

    if message_room
      redirect_to message_room_path(id: message_room.id)
    else
      message_room = MessageRoom.create
      redirect_to message_room_path(id: message_room.id)
    end
  end

  def show
    #@message_room = MessageRoom.find(params[:id])
    @participant_user = User.find_by(params[:participant_user_id])
  end
end
