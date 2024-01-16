class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def show
    @post = Post.find(params[:id])
    @genre = @post.genres
    @posts = @post.main_code
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admins_root_path, notice: "投稿を削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :main_code)
  end
end
