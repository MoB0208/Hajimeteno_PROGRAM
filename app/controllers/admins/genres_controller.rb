class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!

  def show
    # @posts = Post.find(genre)
    # @posts = Post.order(:main_code)
  end
end
