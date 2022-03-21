class MessageRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def create
    participant_user = User.find_by(params[:participant_user_id])
    @message_room = MessageRoom.create
    #@join_current_user = UserMessageRoom.create(user_id: current_user.id, message_room_id: @message_room.id)
    #@join_participant_user = UserMessageRoom.create(participant_user_id: participant_user.id)
    redirect_to message_room_path(@message_room.id)
    #participant_user = User.find_by(params[:participant_user_id])
    #message_room = UserMessageRoom.find_by(user_id: current_user.id, participant_user_id: participant_user.id)&.message_room

    #if message_room
    #else
      #message_room = MessageRoom.create
    #end

    #message = Message.new(message_params)
    #message.save
    #Rails.logger.debug message.errors.full_messages

    #redirect_to message_room_path(id: message_room.id)
  end

  private
  def join_room_params
    params.require(:user_message_room).permit(:participant_user_id, :user_id).merge(message_room_id: @message_room.id)
  end
end
