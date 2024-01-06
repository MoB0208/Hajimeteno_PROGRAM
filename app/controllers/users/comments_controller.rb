class Users::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to posts_show_path(post)
  end

  def edit
  end

  def update
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to posts_show_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end
