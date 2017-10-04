require 'test_helper'

class GalleryTest < ActiveSupport::TestCase
  test "should be valid" do
    assert @gallery.valid?
  end
  test "user id should be present" do
    @gallery.user_id = nil
    assert_not @gallery.valid?
  end

  test "order should be most recent first" do
    assert_equal galleries(:most_recent), Gallery.first
  end
end
