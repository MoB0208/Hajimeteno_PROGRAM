class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genre, only: [:show, :edit, :update]

  def show
    genre_id = params[:genre_id]
    genre_posts = GenrePost.where(genre_id: genre_id).pluck(:post_id)
    @posts = Post.where(id: genre_posts).order(:main_code)
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admins_root_path
  end

  def edit
  end

  def update
    @genre.update(genre_params)
    redirect_to admins_root_path
  end

  private

  def genre_params
     params.require(:genre).permit(:genre_name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end
end
