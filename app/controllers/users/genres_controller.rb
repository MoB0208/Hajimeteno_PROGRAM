class Users::GenresController < ApplicationController

  def index
    @posts = Post.find(genre)
    @posts = Post.order(:main_code)
  end

  def show
  end
end
