class Users::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:create, :edit, :update, :destroy]

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.build(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end

  def edit
    # @post = Post.find(params[:post_id])
    # @comment = Comment.find(params[:id])
    # @comment = Comment.find_by(id: params[:id])
  end

  def update
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_body)
  end

  def set_user
    @user = current_user
  end
end
