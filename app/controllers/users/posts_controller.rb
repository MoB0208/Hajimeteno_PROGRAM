class Users::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    # 投稿する記事
    @post = Post.new
    # 関連記事
    @posts = Post.all
    @genres = Genre.all
    @content = Content.new
    @main_text = MainText.new
    @post_code = PostCode.new
  end

  def create
   # byebug
    @user = current_user
    @post = Post.new(post_params)
    # byebug
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
       # 関連記事の保存
      params[:post][:relation_post_ids].each do |relation_posts|
        @post.relation(relation_posts)
      end
      redirect_to post_path(@post), notice: "投稿しました。"
    else
      @posts = Post.all
      @genres = Genre.all
      @content = Content.new
      @main_text = MainText.new
      @post_code = PostCode.new
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @posts = Post.all
    @genres = Genre.all
    @content = @post.contents
    @main_text = @post.main_texts
    @post_code = @post.post_codes
  end

  def update
    @post = Post.find(params[:id])
    @post.post_relationships.destroy_all
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
        # 関連記事の保存
      params[:post][:relation_post_ids].each do |relation_posts|
        @post.relation(relation_posts)
      end
      redirect_to post_path(@post), notice: "記事を修正しました。"
    else
      render :edit, notice: "記事の保存に失敗しました。"
    end
  end

  def show
    @post = Post.find(params[:id])
    @genre = @post.genres
    @comment = Comment.new

    # 関連記事
    @follower_posts = @post.posts.joins(:genres).where(genres: {id: @post.genres.ids})
    @follow_posts = @post.relation_posts.joins(:genres).where(genres: {id: @post.genres.ids})
    if @follower_posts.blank? && @follow_posts.blank?
      @same_posts = []
    elsif @follower_posts.blank?
      @same_posts = @follow_posts
    elsif @follow_posts.blank?
      @same_posts = @follower_posts
    else
      @same_posts = Post.where(id: @follower_posts.ids+@follow_posts.ids)
    end

    # 別言語の関連記事
    @other_follower_posts = @post.posts.where(main_code: @post.main_code)
    @other_follow_posts = @post.relation_posts.where(main_code: @post.main_code)
    if @other_follower_posts.blank? && @other_follow_posts.blank?
      @other_posts = []
    elsif @other_follower_posts.blank?
      @other_posts = @other_follow_posts
    elsif @other_follow_posts.blank?
      @other_posts = @other_follower_posts
    else
      @other_posts = Post.where(id: @other_follower_posts.ids+@other_follow_posts.ids)
    end
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
      genre_ids: [],
      # relation_post_ids: []
      # relation_post_idsは関連記事
    )
    if values[:genre_ids].nil?
      values[:genre_ids] = []
    end
    return values
  end
end
