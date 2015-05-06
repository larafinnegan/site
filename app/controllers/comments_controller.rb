class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comments_params)
    if @comment.save
      redirect_to @post
    else
      render @post
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def comments_params
    params.require(:comment).permit(:author, :content)
  end
end
