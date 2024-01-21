class Users::GenresController < ApplicationController

  def show
    @posts = Post.where(genre_name: params[:id]).order(:main_code)
    @genre = Genre.where(genre_name: params[:id]).first
  end

  private

  def post_params
    params.require(:post).permit(:title, :main_code)
  end

  def genre_params
    params.require(:genre).permit(:genre_name, :version)
  end
end
