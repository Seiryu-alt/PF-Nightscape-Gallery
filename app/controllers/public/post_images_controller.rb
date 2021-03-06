class Public::PostImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def show
    @post_image = PostImage.find(params[:id])
    @post_image_comments = @post_image.post_image_comments.includes(:user)
    gon.latitude = @post_image.latitude
    gon.longitude = @post_image.longitude
    gon.location_name = @post_image.location_name
    @new_comment = PostImageComment.new
  end

  def new
    @post_image = PostImage.new
    gon.latitude = @post_image.latitude
    gon.longitude = @post_image.longitude
  end

  def create
    @post_image = current_user.post_images.new(post_image_params)
    if @post_image.save
      @post_image.update_tag_from_list(params[:post_image][:tag_list])
      flash[:notice] = "投稿しました"
      redirect_to post_image_path(@post_image.id)
    else
      gon.latitude = @post_image.latitude
      gon.longitude = @post_image.longitude
      render :new
    end
  end

  def edit
    @post_image = PostImage.find(params[:id])
    gon.latitude = @post_image.latitude
    gon.longitude = @post_image.longitude
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      @post_image.update_tag_from_list(params[:post_image][:tag_list])
      flash[:notice] = "変更を保存しました"
      redirect_to post_image_path(@post_image.id)
    else
      gon.latitude = @post_image.latitude
      gon.longitude = @post_image.longitude
      render :new
    end
  end

  def maps
    post_images = PostImage.where.not(location_name: [nil, ''], latitude: nil, longitude: nil)
    gon.post_images = post_images.map do |post_image|
      { id: post_image.id,
        location_name: post_image.location_name,
        longitude: post_image.longitude,
        latitude: post_image.latitude,
        image_url: Refile.attachment_url(post_image, :image, :fill, 150, 100) }
    end
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to root_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :description, :location_name, :latitude, :longitude)
  end
end
