class Public::LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    user = User.find(params[:user_id])
    @post_images = user.like_post_images
  end

  def create
    @post_image = PostImage.find(params[:post_image_id])
    current_user.like(@post_image)
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    current_user.unlike(@post_image)
  end
end
