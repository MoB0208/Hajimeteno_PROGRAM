class Users::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      puts @post.errors.full_messages
      redirect_to user_home_path(@user), notice: "投稿しました。"
    else
      @posts = Post.all
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @genre = @post.genre
    @post_code = @post.post_code
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
    if params[:genre_name]
    else
    @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = @post.main_code
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :main_code)
    params.require(:genre).permit(:genre_name, :version)
    params.require(:post_code).permit(:code, :body)
  end
end
