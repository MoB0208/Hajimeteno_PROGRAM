class Users::HomesController < ApplicationController
  def top
    @genres = Genre.all
    # お気に入りが多い順の投稿一覧
    @favorite_posts = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    # 新着20件
    @posts = Post.order('id DESC').limit(20)
  end
end
