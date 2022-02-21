class MessageRoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user_message_rooms = UserMessageRoom.where(user_id: current_user.id).map(&:message_room)
    message_room = UserMessageRoom.where(message_room: current_user_message_rooms, user_id: params[:user_id]).map(&:message_room).first
    
    if message_room.blank?
      message_room = MessageRoom.create
      MessageRoom.create(message_room: message_room, user_id: current_user.id)
      UserMessageRoom.create(message_room: message_room, user_id: params[:user_id])
    end

    redirect_to action: :show, id: message_room.id
  end

  def show
  end
end
