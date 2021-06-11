class Public::HomesController < ApplicationController
  def top
    @most_liked_post_images = PostImage.includes(:likes)
                                       .sort_by { |post_image| post_image.likes.size }
                                       .last(5).reverse
    @post_images = PostImage.all.order(updated_at: :desc).page(params[:page]).per(3)
  end

  def about
  end
end
