require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup 
    @user = User.new(name: "Lara", password: "password", password_confirmation: "password")
  end

  test "should be valid" do 
    assert @user.valid?
  end

  test "name should be present" do 
    @user.name = "    "
    assert_not @user.valid?
  end

  test "password should be long enough" do 
    @user.password = @user.password_confirmation = "z" * 5
    assert_not @user.valid?
  end
end
