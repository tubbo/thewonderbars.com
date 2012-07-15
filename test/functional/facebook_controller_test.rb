require 'test_helper'

class FacebookControllerTest < ActionController::TestCase
  test "should get about_us" do
    get :about_us
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
