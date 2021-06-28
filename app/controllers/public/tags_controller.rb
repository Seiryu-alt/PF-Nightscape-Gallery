class Public::TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @post_images = @tag.post_images.order(updated_at: :desc).page(params[:page]).per(12)
  end
end
