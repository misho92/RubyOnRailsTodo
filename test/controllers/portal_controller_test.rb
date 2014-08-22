require 'test_helper'

class PortalControllerTest < ActionController::TestCase
  test "should get portal" do
    get :portal
    assert_response :success
  end

end
