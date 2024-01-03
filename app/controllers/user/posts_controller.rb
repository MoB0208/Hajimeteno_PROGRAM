class User::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to user_home_path(@user), notice: "投稿しました。"
    else
      @posts = Post.all
      redirect_to user_posts_new_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_home_path(@user), notice: "投稿を修正しました。"
    else
      render :edit
    end
  end

  def index
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :main_code)
  end
end
