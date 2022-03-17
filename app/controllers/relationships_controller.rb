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

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

end
