class MessageRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_message_rooms = UserMessageRoom.all
  end

  def create
    @message_room = MessageRoom.create
    
  end

  def show
    @message_room = MessageRoom.find(params[:id])
  end
end
