class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
  end

  def following
    @user = User.find(params[:user_id])
    @following_users = @user.following_users.page(params[:page]).per(10)
  end

  def follower
    @user = User.find(params[:user_id])
    @follower_users = @user.follower_users.page(params[:page]).per(10)
  end
end
