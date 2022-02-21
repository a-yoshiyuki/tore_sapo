class MessageRoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user_message_rooms = UserMessageRoom.where(user_id: current_user.id).map(&:message_room)
    message_room = UserMessageRoom.where(message_room: current_user_message_rooms, user_id: params[:user_id]).map(&:message_room).first
    
    if message_room.blank?
      message_room = MessageRoom.create
      UserMessageRoom.create(message_room: message_room, user_id: current_user.id)
      UserMessageRoom.create(message_room: message_room, user_id: params[:user_id])
    end

    redirect_to action: :show, id: message_room.id
  end

  def show
    @message_room = MessageRoom.find(params[:id])
    @user_message_room = @message_room.user_message_room.where.not(user_id: current_user.id).first.user
    @messages = Message.where(message_room: @message_room)
  end
end
