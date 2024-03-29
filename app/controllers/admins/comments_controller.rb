class Admins::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comments = Comment.all
    @comments = Kaminari.paginate_array(@comments).page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comments = Comment.where(user_id: @comment.user_id)
    @comments = Kaminari.paginate_array(@comments).page(params[:page]).per(10)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admins_root_path, notice: "コメントを削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :main_code)
  end
end
