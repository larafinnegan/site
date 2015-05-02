require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @comment = Comment.new
  end

  test "comment author names should be saved as lower-case with the first letter capitalized" do
    author = "vAnAmAkU"
    @comment.author = author
    @comment.save
    assert_equal author.downcase.capitalize, @comment.reload.author
  end
end
