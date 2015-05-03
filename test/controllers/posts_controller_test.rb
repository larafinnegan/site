require 'test_helper'

class PostsControllerTest < ActionController::TestCase

def setup
  @tag = tags(:html)
  @post = posts(:first)
  @posts = Post.all
end
  
  test "should get index" do 
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get show" do 
    get :show, id: @post.id
    assert_response :success
  end

end
