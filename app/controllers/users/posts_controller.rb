class Users::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @post = Post.new
    @genre = Genre.new
    @content = Content.new
    @main_text = MainText.new
    @post_code = PostCode.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @genre = @post.genres.build(
      genre_name: params[:post][:genre][:genre_name],
      version: params[:post][:genre][:version],
    )
    @content = @post.contents.build(
      table_of_content: params[:post][:content][:table_of_content],
    )
    @main_text = @post.main_texts.build(
      body: params[:post][:main_text][:body],
    )
    @post_code = @post.post_codes.build(
      position: params[:post][:post_code][:position],
      code: params[:post][:post_code][:code],
    )
    @post.user_id = current_user.id
    if @post.save
      redirect_to home_path, notice: "投稿しました。"
    else
      @posts = Post.all
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @genre = @post.genres.find(
      genre_name: params[:post][:genre][:genre_name],
      version: params[:post][:genre][:version],
    )
    @content = @post.contents
    @main_text = @post.main_texts
    @post_code = @post.post_codes
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to home_path, notice: "投稿を修正しました。"
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
    @genre = @post.genres
    @posts = @post.main_code
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to home_path, notice: "投稿を削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :main_code)
  end
end
