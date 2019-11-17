require 'test_helper'

class InsectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get insects_new_url
    assert_response :success
  end

  test "should get show" do
    get insects_show_url
    assert_response :success
  end

end
