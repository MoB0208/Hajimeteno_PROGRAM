class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!

  def show
    @genre = Genre.find(params[:id])
    genre_id = params[:genre_id]
    genre_posts = GenrePost.where(genre_id: genre_id).pluck(:post_id)
    @posts = Post.where(id: genre_posts)
  end
end
