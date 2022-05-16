class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    if UserMessageRoom.where(user_id: current_user.id, message_room_id: params[:message][:message_room_id]).present?
      @message = Message.create!(message_params.slice(:user_id, :message_room_id, :content))
      redirect_to message_room_path(@message.message_room_id)
    else
      flash[:alert] = "メッセージの送信に失敗しました。"
    end
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :message_room_id, :content).merge(user_id: current_user.id)
  end
end