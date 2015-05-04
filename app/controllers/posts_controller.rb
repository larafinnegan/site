class PostsController < ApplicationController

  def index
    @tags = Tag.all
    if params[:tag]
      @posts = Post.joins(:tags).where('tag_id = ?', params[:tag]).paginate(page: params[:page], :per_page => 5)
    else
      @posts = Post.paginate(page: params[:page], :per_page => 5)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end


  def show
    @tags = Tag.all
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :tags)
  end

end
