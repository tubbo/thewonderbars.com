require 'test_helper'

class FacebookControllerTest < ActionController::TestCase
  setup do
    VCR.use_cassette(:facebook_authentication) do
      @controller = FacebookController.new 
    end
  end

  test "access the bio page" do
    VCR.use_cassette(:facebook_authentication) do
      get :about_us
      assert response.success?
    end
  end

  test "access the contact page" do
    VCR.use_cassette(:facebook_authentication) do
      get :contact
      assert response.success?
    end
  end

  test "access the event listing" do
    VCR.use_cassette(:facebook_authentication) do
      get :events
      assert response.success?
    end
  end

  test "access the personnel profiles" do
    VCR.use_cassette(:facebook_authentication) do
      get :members
      assert response.success?
    end
  end
end
