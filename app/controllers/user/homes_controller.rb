class User::HomesController < ApplicationController
  def top
    @genres = Genres.all
    @favorite_posts = Favorite.post.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    @posts = Post.page(params[:page]).per(20).order(created_at: :desc)
    # 20件ごとに新着順で表記
  end
end
