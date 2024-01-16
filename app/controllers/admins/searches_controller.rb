class Admins::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'Post'
      @records = Post.search_for(@content, @method)
    elsif @model == 'PostCode'
      @records = PostCode.search_for(@content, @method)
    elsif @model == 'Content'
      @records = Content.search_for(@content, @method)
    else
      @records = MainText.search_for(@content, @method)
    end
  end

  def index
  end
end
