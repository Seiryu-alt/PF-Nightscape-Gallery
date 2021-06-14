class Public::PostImageCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_image = PostImage.find(params[:post_image_id])
    @new_comment = PostImageComment.new(post_image_comment_params)
    @new_comment.user_id = current_user.id
    @new_comment.post_image_id = @post_image.id
    return unless @new_comment.save

    @new_comment = PostImageComment.new
  end

  def destroy
    post_image_comment = PostImageComment.find(params[:id])
    post_image_comment.destroy if post_image_comment.user == current_user
    @post_image = PostImage.find(params[:post_image_id])
  end

  private

  def post_image_comment_params
    params.require(:post_image_comment).permit(:comment)
  end
end
