class Admin::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'Post'
      @records = Post.search_for(@content, @method)
    else
      @records = PostCode.search_for(@content, @method)
    end
  end

  def index
  end
end
