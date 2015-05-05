require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:lara)
  end

  test "login with valid information" do 
    get posts_path
    assert_select "a[href=?]", new_post_path, count: 0
    get login_path
    post login_path, session: { name: @user.name, password: "password" }
    assert_redirected_to root_path
    get posts_path
    assert_select "a[href=?]", new_post_path
  end

end
