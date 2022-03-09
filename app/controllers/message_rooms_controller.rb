class MessageRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @message = Message.new
    @participant_user = User.find_by(params[:participant_user_id])
  end

  def create
    participant_user = User.find_by(params[:participant_user_id])
    message_room = UserMessageRoom.find_by(user_id: current_user.id, participant_user_id: participant_user.id)&.message_room

    if message_room
    else
      message_room = MessageRoom.create
    end

    message = Message.new(message_params)
    message.save
    Rails.logger.debug message.errors.full_messages

    redirect_to message_room_path(id: message_room.id)
  end

  def show
  end

  private
  def message_params
    params.require(:message).permit(:content, :participant_user_id, :user_id, :message_room_id)
  end
end
