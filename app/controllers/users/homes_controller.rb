class Users::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @favorite_posts = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    # お気に入りが多い順の投稿一覧
    #@favorite_posts = Favorite.post.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    @posts = Post.order('id DESC').limit(20)
    # 新着20件
  end
end
