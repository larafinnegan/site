require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:lara)
  end

  test "login with invalid info" do 
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { name: " ", password: " " }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
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
