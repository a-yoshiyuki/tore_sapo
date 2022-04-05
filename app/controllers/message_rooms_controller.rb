class MessageRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    participant_user = User.find_by(params[:participant_user_id])
    @message_room = MessageRoom.create
    join_user = UserMessageRoom.find_or_create_by(user_id: current_user.id, participant_user_id: participant_user.id, message_room_id: @message_room.id)
    redirect_to message_room_path(@message_room.id)
  end

  def show
    @participant_user = User.find_by(params[:participant_user_id])
    @message_room = MessageRoom.find(params[:id])
    if UserMessageRoom.where(user_id: current_user.id, message_room_id: @message_room.id, participant_user_id: @participant_user.id).present?
      @messages = @message_room.messages
      @message = Message.new
      @user_message_room = @message_room.user_message_rooms
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def join_room_params
    params.require(:user_message_room).permit(:participant_user_id, :user_id).merge(message_room_id: @message_room.id)
  end
end
