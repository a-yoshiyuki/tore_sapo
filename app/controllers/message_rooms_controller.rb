class MessageRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def show
    @user = User.find(params[:id])
    @current_user_message_room = UserMessageRoom.where(user_id: current_user.id)
    @receiveUser = UserMessageRoom.where(user_id: @user.id)

    unless @user.id == current_user.id  #current_userと@userが一致していなければ
      @current_user_message_room.each do |cu|    #current_userが参加していルームを取り出す
        @receiveUser.each do |u|    #@userが参加しているルームを取り出す
          if cu.room_id == u.room_id    #current_userと@userのルームが同じか判断(既にルームが作られているか)
            @have_message_room = true    #falseの時(同じじゃない時)の条件を記述するために変数に代入
            @room_id = cu.room_id   #ルームが共通しているcurrent_userと@userに対して変数を指定
          end
        end
      end
      unless @have_message_room    #ルームが同じじゃなければ
        #新しいインスタンスを生成
        @message_room = MessageRoom.new
        @user_message_room = UserMessageRoom.new
        #//新しいインスタンスを生成
      end
    end
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

  private
  def message_params
    params.require(:message).permit(:content, :participant_user_id, :user_id, :message_room_id)
  end
end
