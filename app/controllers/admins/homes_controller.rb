class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @users = User.all
    @genres = Genre.all
    @comments = Comment.order('id DESC').limit(20)
    # 新着20件
    @posts = Post.order('id DESC').limit(20)
    # 新着20件
  end
end
