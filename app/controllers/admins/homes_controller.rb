class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @users = User.all
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(15)
    @genres = Genre.all
    @genre = Genre.new
    # コメント新着20件
    @comments = Comment.order('id DESC').limit(20)
    @comments = Kaminari.paginate_array(@comments).page(params[:page]).per(5)
    # 記事新着20件
    @posts = Post.order('id DESC').limit(20)
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
  end
end
