require 'test_helper'

class FacebookControllerTest < ActionController::TestCase
  setup { @controller = FacebookController.new }

  test "access the bio page" do
    VCR.use_cassette(:facebook_authentication) do
      get :about_us
      assert_response :success
    end
  end

  test "access the contact page" do
    VCR.use_cassette(:facebook_authentication) do
      get :contact
      assert_response :success
    end
  end

  test "access the event listing" do
    VCR.use_cassette(:facebook_authentication) do
      get :events
      assert_response :success
    end
  end

  test "access the personnel profiles" do
    VCR.use_cassette(:facebook_authentication) do
      get :members
      assert_response :success
    end
  end
end
