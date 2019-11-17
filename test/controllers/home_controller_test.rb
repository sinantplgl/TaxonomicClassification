require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_in" do
    get home_sign_in_url
    assert_response :success
  end

end
