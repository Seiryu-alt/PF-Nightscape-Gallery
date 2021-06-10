class Public::TagsController < ApplicationController
  def show
    tag = Tag.find(params[:id])
    @post_images = tag.post_images
  end
end
