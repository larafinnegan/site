require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = "Lara Finnegan"
  end
  
  test "should get home" do 
    get :home
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get projects" do 
    get :projects
    assert_response :success
    assert_select "title", "Projects | #{@base_title}"
  end

  test "should get about" do 
    get :about
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

end
