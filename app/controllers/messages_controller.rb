class MessagesController < ApplicationController
  before_action :authenticate_user! 

  def create
    if UserMessageRoom.where(user_id: current_user.id, message_room_id: @message_room.id, participant_user_id: @participant_user).present?
      @message = Message.create(message_params)
      redirect_to message_room_path(@message.room_id)
    else
      flash[:alert] = "メッセージの送信に失敗しました。"
    end
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :message_room_id, :participant_user_id, :content).merge(user_id: current_user.id)
  end
end