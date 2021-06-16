class Public::PostImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def show
    @post_image = PostImage.find(params[:id])
    @new_comment = PostImageComment.new
  end

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = current_user.post_images.new(post_image_params)
    if @post_image.save
      @post_image.update_tag_from_list(params[:post_image][:tag_list])
      redirect_to post_image_path(@post_image.id)
    else
      render :new
    end
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      @post_image.update_tag_from_list(params[:post_image][:tag_list])
      redirect_to post_image_path(@post_image.id)
    else
      render :new
    end
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to mypage_path
  end

  def search
    @users = find_users(params[:keyword]).order(updated_at: :desc)
    @post_images = find_post_images(params[:keyword]).order(updated_at: :desc)
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :description, :location_name, :latitude, :longitude)
  end

  def find_users(keyword)
    User.where("name LIKE? OR introduction LIKE?", "%#{keyword}%", "%#{keyword}%")
  end

  def find_post_images(keyword)
    post_image_ids = PostImage.where("description LIKE?", "%#{keyword}%").pluck(:post_image_id)
    tag_ids = Tag.where("name LIKE?", "%#{keyword}%").pluck(:id)
    post_image_ids += TagMap.where(tag_id: tag_ids).pluck(:post_image_id)
    post_image_ids.uniq!
    PostImage.where(id: post_image_ids)
  end
end
