class Users::GenresController < ApplicationController

  def index
    @posts = Post.find(genre)
    @posts = Post.order(:main_code)
  end

  def show
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :main_code)
  end

  def genre_params
    params.require(:genre).permit(:genre_name, :version)
  end
end
