class Users::SearchesController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'Post'
      @records = Post.search_for(@content, @method)
    else
      @records = PostCode.search_for(@content, @method)
    else
      @records = Content.search_for(@content, @method)
    else
      @records = MainText.search_for(@content, @method)
    end
  end

  def index
  end
end
