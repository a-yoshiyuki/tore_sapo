class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:follower])
    current_user.follow(@user)
  end

  def destroy
    @user = current_user.relationships.find(params[:id]).follower
    current_user.unfollow(params[:id])
  end

  def followings
    @user = User.find(params[:id])
    @participant_user = @user.followings
    @current_user_message_room = UserMessageRoom.where(user_id: current_user.id)
    @receive_user = UserMessageRoom.where(user_id: @participant_user)

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

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

end
