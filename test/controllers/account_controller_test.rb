require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get account" do
    get :account
    assert_response :success
  end

end
