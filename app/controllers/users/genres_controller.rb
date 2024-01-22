class Users::GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    @posts = Post.where(genre_name: params[:id]).order(:main_code)
  end

  private

  def post_params
    params.require(:post).permit(:title, :main_code)
  end

  def genre_params
    params.require(:genre).permit(:genre_name, :version)
  end
end
