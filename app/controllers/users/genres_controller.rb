class Users::GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    genre_id = params[:genre_id]
    genre_posts = GenrePost.where(genre_id: genre_id).pluck(:post_id)
    @posts = Post.where(id: genre_posts).order(:main_code)
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
  end
end
