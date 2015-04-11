require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:alize)
    # This code is not idiomatically correct.
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present " do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

  test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  test "order should be most recent first" do
    assert_equal Micropost.first, microposts(:most_recent)
  end

  test "search should find text in content" do
    assert_equal 1, Micropost.search('orange').count
    assert_equal 2, Micropost.search('cats').count
    assert_equal 0, Micropost.search('does not exist').count
    assert_equal Micropost.count, Micropost.search('').count
  end
end
