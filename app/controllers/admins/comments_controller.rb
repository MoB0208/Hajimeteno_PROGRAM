class Admins::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def inde
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
    @comments = Comment.where(user_id: params[:id])
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
