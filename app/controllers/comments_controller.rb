class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comments_params)
    redirect_to @post
  end

  def destroy
  end

  private

  def comments_params
    params.require(:comment).permit(:author, :content)
  end
end
