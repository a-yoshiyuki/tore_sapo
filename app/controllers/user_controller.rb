class UserController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def index
    @users = User.where(user_style: 0)
  end

  def show
    @user = User.find(params[:id])
    @current_user_message_room = UserMessageRoom.where(user_id: current_user.id)
    @receive_user = UserMessageRoom.where(user_id: @user.id)

    unless @user.id == current_user.id
      @current_user_message_room.each do |cu|    #current_userが参加していルームを取り出す
        @receive_user.each do |u|    #@userが参加しているルームを取り出す
          if cu.message_room_id == u.message_room_id    #current_userと@userのルームが同じか判断(既にルームが作られているか)
            @have_message_room = true    #falseの時(同じじゃない時)の条件を記述するために変数に代入
            @room_id = cu.message_room_id   #ルームが共通しているcurrent_userと@userに対して変数を指定
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

  private
  def user_params
    params.require(:user).permit(:user_id, :name, :image, :self_introduction, :user_style, :career)
  end
end
