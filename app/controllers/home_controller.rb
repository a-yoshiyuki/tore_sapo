class HomeController < ApplicationController
  def index
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :image,:self_introduction, :user_style, :career)
  end
end
