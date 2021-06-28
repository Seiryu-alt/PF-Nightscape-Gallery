class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.order(updated_at: :desc).includes(:tags).page(params[:page]).per(5)
  end

  def mypage
    following_users_id = current_user.following_users.pluck(:id)
    @post_images = PostImage.where(user_id: following_users_id)
                            .order(updated_at: :desc)
                            .includes(:user, :tags)
                            .page(params[:page]).per(5)
  end
end
