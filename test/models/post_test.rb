require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:lara)
    @post = @user.posts.build(title: "title", content: "content")
  end

  test "post is valid" do 
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "title should be present" do 
    @post.title = "    "
    assert_not @post.valid?
  end

  test "content should be present" do 
    @post.content = "   "
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal Post.first, posts(:most_recent)
  end

  test "associated comments should be destroyed if post is deleted" do 
    @post.save
    @post.comments.create!(author: "John", content: "comment content")
    assert_difference 'Comment.count', -1 do 
      @post.destroy 
    end
  end
end
