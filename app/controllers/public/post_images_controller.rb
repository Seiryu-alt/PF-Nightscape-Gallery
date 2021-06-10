class Public::PostImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def show
    @post_iamge = PostImage.find(params[:id])
    @comments = @post_iamge.post_iamge_comments
    @new_comment = PostImageComment.new
  end

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    if @post_image.save
      @post_iamge.update_tag_from_list(params[:post_image][:tag_list])
      redirect_to post_image_path(@post_iamge.id)
    else
      render :new
    end
  end

  def edit
    @post_iamge = PostImage.find(params[:id])
  end

  def update
    @post_iamge = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      @post_iamge.update_tag_from_list(params[:post_image][:tag_list])
      redirect_to post_image_path(@post_iamge.id)
    else
      render :new
    end
  end

  def destroy
    post_iamge = PostImage.find(params[:id])
    post_iamge.destroy
    redirect_to root_path
  end

  def search
  end

  private

  def post_image_params
    params.permit(:post_iamge).require(:image, :description, :iso, :aperture, :shutter_speed)
  end
end
