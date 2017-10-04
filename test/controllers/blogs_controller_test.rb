require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @blog = Blog.new(content: "Lorem ipsum", user_id: @user.id)
  end
  test "should get index" do
    get blogs_index_url
    assert_response :success
  end

  test "should be valid" do
    assert @blog.valid?
  end

  test "user id should be present" do
    @blog.user_id = nil
    assert_not @blog.valid?
  end
end
