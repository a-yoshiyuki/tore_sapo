class UserController < ApplicationController
  def home
    @user = current_user
  end

  def index
  end

  private
  def user_params
    params.require(:user).permit(:name, :image,:self_introduction, :user_style, :career)
  end
end
