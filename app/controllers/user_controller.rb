class UserController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def index
    @users = User.where(user_style: 0)
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:user_id, :name, :image, :self_introduction, :user_style, :career)
  end
end
