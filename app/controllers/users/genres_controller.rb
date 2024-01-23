class Users::GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    genre_id = params[:genre_id]
    genre_posts = GenrePost.where(genre_id: genre_id).pluck(:post_id)
    @posts = Post.where(id: genre_posts)
    # @posts = Post.where(genre_post_id: @genre.id).all
    # @posts = Post.where(genre_name: params[:id]).order(:main_code)
  end

  # private

  # def post_params
  #   params.require(:post).permit(:title, :main_code, :version)
  # end

  # def genre_params
  #   params.require(:genre).permit(:genre_name)
  # end
end
