require 'test_helper'

class TagTest < ActiveSupport::TestCase
  
  def setup
    @tag = Tag.new(name: "HTML")
  end

  test "tag is valid" do 
    assert @tag.valid?
  end

  test "tag name is not blank" do 
    @tag.name = "   "
    assert_not @tag.valid?
  end

  test "tag name must be unique" do 
    @tag.save
    second_tag = @tag.dup
    assert_not second_tag.valid?
  end

  test "tag name uniqueness is case-insensitive" do 
    @tag.save
    second_tag = @tag.dup
    second_tag.name.downcase!
    assert_not second_tag.valid?
  end
end
