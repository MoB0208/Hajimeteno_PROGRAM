class Admin::HomesController < ApplicationController
  def top
    @comments = Comment.page(params[:page]).per(20).order(created_at: :desc)
    # 20件ごとに新着順で表記
    @user = User.page(params[:page]).per(20)
    @posts = Post.page(params[:page]).per(20).order(created_at: :desc)
    # 20件ごとに新着順で表記
    @genres = Genres.all
  end
end
