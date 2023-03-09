require "test_helper"

class UserEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_events_index_url
    assert_response :success
  end
end
