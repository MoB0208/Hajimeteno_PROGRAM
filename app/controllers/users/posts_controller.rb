class Users::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @post = Post.new
    @genres = Genre.all
    @content = Content.new
    @main_text = MainText.new
    @post_code = PostCode.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
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
      redirect_to post_path(@post), notice: "投稿しました。"
    else
      @posts = Post.all
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
    # @genres = @post.genres
    @content = @post.contents
    @main_text = @post.main_texts
    @post_code = @post.post_codes
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       @content = @post.contents.update(
         table_of_content: params[:post][:content][:table_of_content],
       )
       @main_text = @post.main_texts.update(
         body: params[:post][:main_text][:body],
       )
       @post_code = @post.post_codes.update(
         position: params[:post][:post_code][:position],
         code: params[:post][:post_code][:code],
       )
      redirect_to post_path(@post), notice: "記事を修正しました。"
    else
      render :edit, notice: "記事の保存に失敗しました。"
    end
  end

  def show
    @post = Post.find(params[:id])
    @genre = @post.genres
    @posts = @post.main_code
    @comment = Comment.new
    # @same_posts = Post.where(genre_id: @post.genre.genre_id)
    # @other_posts = Post.where(main_code: @post.main_code)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to home_path, notice: "記事を削除しました。"
  end

  private

  def post_params
    values = params.require(:post).permit(
      :title, :main_code, :version,
      genre_ids: []
    )
    if values[:genre_ids].nil?
      values[:genre_ids] = []
    end
    return values
  end
end
