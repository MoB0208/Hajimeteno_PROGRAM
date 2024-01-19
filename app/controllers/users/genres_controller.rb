class Users::GenresController < ApplicationController

  def show
    @posts = Post.find(genre)
    @posts = Post.order(:main_code)
    # @posts = Post.find(genre.genre_name)
    # @genre_id = params[:genre_id]
    # @posts = Post.where(genre_id: @genre_id)

    # @genre = Genre.find_by(genre_name: params[:id]) # params[:id]はリクエストパラメータから取得した検索するgenre_nameの値です
    # if @genre.present?
    #   @posts = Post.joins(:genre).where(genres: { genre_name: genre.genre_name })
    # else
    #   @posts = []
    # end
  end

  private

  def post_params
    params.require(:post).permit(:title, :main_code)
  end

  def genre_params
    params.require(:genre).permit(:genre_name, :version)
  end
end
