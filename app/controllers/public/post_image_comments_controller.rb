class Public::PostImageCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post_image = PostImage.find(params[:post_image_id])
    @post_iamge_comment = post_image.post_image_comments.new(post_image_comment_params)
    @post_iamge_comment.user_id = current_user.id
    @post_iamge_comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post_iamge_comment = PostImageComment.find(params[:id])
    post_iamge_comment.destroy
  end

  private

  def post_image_comment_params
    params.permit(:post_iamge_comment).require(:comment)
  end
end
