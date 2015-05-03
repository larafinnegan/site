class PostsController < ApplicationController

  def index
    @tags = Tag.all
    if params[:tag]
      @posts = Post.joins(:tags).where('tag_id = ?', params[:tag]).paginate(page: params[:page], :per_page => 5)
    else
      @posts = Post.paginate(page: params[:page], :per_page => 5)
    end
  end

  def show
    @tags = Tag.all
    @post = Post.find(params[:id])
  end

end
