require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  def setup
    @comment = comments(:comment_one)
  end

  test "should redirect destroy when not logged in" do 
    assert_no_difference 'Comment.count' do 
      delete :destroy, id: @comment.id
    end
  end
end
