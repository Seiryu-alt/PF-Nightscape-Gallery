class Public::HomesController < ApplicationController
  def top
    most_liked_post_images = PostImage.includes(:likes)
                                      .sort_by { |post_image| post_image.likes.size }
                                      .last(5)
    gon.bg_img_urls = most_liked_post_images.map do |post_image|
      { src: Refile.attachment_url(post_image, :image, :limit, 1000, 1000, format: 'jpg') }
    end
    gon.post_image_urls = most_liked_post_images.map { |post_image| post_image_path(post_image) }
    @post_images = PostImage.all.order(updated_at: :desc).includes(:user, :tags).page(params[:page]).per(3)
  end

  def search
    @keyword = params[:keyword]
    if @keyword.blank?
      redirect_back fallback_location: root_path
      flash[:alert] = "検索ワードを指定してください"
    else
      @users = find_users(@keyword).includes(:follower_users).page(params[:user_page]).per(20)
      @post_images = find_post_images(@keyword).includes(:user, :tags).page(params[:post_image_page]).per(10)
    end
  end

  private

  def find_users(keyword)
    User.where("name LIKE? OR introduction LIKE?", "%#{keyword}%", "%#{keyword}%").order(updated_at: :desc)
  end

  def find_post_images(keyword)
    post_image_ids = PostImage.where("description LIKE?", "%#{keyword}%").pluck(:id)
    tag_ids = Tag.where("name LIKE?", "%#{keyword}%").pluck(:id)
    post_image_ids += TagMap.where(tag_id: tag_ids).pluck(:post_image_id)
    post_image_ids.uniq!
    PostImage.where(id: post_image_ids).order(updated_at: :desc)
  end
end
