require "test_helper"

class LandingControllerTest < ActionDispatch::IntegrationTest
  test "landing page loads successfully" do
    get root_url
    assert_response :success
  end
end
