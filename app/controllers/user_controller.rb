class UserController < ApplicationController
  before_action :authenticate_user!

  def home
    @user = current_user
  end

  def index
    @trainers = User.where(user_style: 0)
  end

  private
  def user_params
    params.require(:user).permit(:name, :image,:self_introduction, :user_style, :career)
  end
end
