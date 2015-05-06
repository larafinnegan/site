class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def show
    @tags = Tag.all
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :tags)
  end

end
