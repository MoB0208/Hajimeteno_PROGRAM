class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def show
  end
end
