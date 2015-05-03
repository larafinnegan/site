require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @post = posts(:first)
    @comment = @post.comments.build(author: "frank", content: "Awesome post!")
  end

  test "should be valid" do 
    assert @comment.valid?
  end

  test "author should not be blank" do 
    @comment.author = "   "
    assert_not @comment.valid?
  end

  test "content should not be blank" do 
    @comment.content = "   "
    assert_not @comment.valid?
  end
end
