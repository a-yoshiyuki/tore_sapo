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
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers

  end

end
