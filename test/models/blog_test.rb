require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @blog = @user.blogs.build(body: "Lorem ipsum")
  end

  test "should be valid" do
    assert @blog.valid?
  end
  test "user id should be present" do
    @blog.user_id = nil
    assert_not @blog.valid?
  end

  test "body should be present" do
    @blog.body = "   "
    assert_not @blog.valid?
  end
  test "order should be most recent first" do
    assert_equal blogs(:most_recent), Blog.first
  end
end
