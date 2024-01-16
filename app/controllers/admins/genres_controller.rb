class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.find(genre)
    @posts = Post.order(:main_code)
  end

  def show
  end
end
