class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comments_params)
    if @comment save
      redirect_to @post
    else
      render @post
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:author, :content)
  end
end
