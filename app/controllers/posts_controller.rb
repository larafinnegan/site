class PostsController < ApplicationController

  def index
    @posts = Post.paginate(page: params[:page], :per_page => 5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
  end


  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
