class RelationshipsController < ApplicationController

  def create
    @user = current_user
    other_user = User.find(params[:follower])
    @user.follow(other_user)
    redirect_to user_trainer_show_path(other_user)
  end

  def destroy
    @user = current_user.relationships.find(params[:id]).follower
    current_user.unfollow(params[:id])
    redirect_to user_trainer_show_path
  end

end
