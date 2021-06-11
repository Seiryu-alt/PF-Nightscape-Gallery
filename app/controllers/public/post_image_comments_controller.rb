class Public::PostImageCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post_image = PostImage.find(params[:post_image_id])
    @new_comment = post_image.post_image_comments.new(post_image_comment_params)
    @new_comment.user_id = current_user.id
    return unless @new_comment.save

    @new_comment = PostImageComment.new
  end

  def destroy
    post_image_comment = PostImageComment.find(params[:id])
    post_image_comment.destroy
  end

  private

  def post_image_comment_params
    params.permit(:post_image_comment).require(:comment)
  end
end
