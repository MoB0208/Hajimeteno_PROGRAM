class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @users = User.all
    @genres = Genre.all
    # コメント新着20件
    @comments = Comment.order('id DESC').limit(20)
    # 記事新着20件
    @posts = Post.order('id DESC').limit(20)
  end
end
