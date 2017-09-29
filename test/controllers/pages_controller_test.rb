require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get home" do
    get root_path
    assert_response :success
  end
  test "should get about" do
  get about_path
  assert_response :success
  end
  test "should get album" do
  get album_path
  assert_response :success
  end
  test "should get blog" do
  get blog_path
  assert_response :success
  end
end
