class MessageRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    @message_room = MessageRoom.create
    join_current_user = UserMessageRoom.find_or_create_by(user_id: current_user.id, message_room_id: @message_room.id)
    join_user = UserMessageRoom.create(join_room_params)

    redirect_to message_room_path(@message_room.id)
  end

  def show
    @message_room = MessageRoom.find(params[:id])
    if UserMessageRoom.where(user_id: current_user.id, message_room_id: @message_room.id).present?
      @messages = @message_room.messages
      @message = Message.new
      @user_message_room = @message_room.user_message_rooms
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def join_room_params
    params.require(:user_message_room).permit(:user_id, :message_room_id).merge(message_room_id: @message_room.id)
  end
end
