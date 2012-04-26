require 'test_helper'

class FacebookClientTest < ActiveSupport::TestCase
  setup {
    @facebook = FacebookClient.new
  }

  # should "generate an access token based on the given config" do
  #   refute_nil @facebook.access_token, "Access token generation failed: #{@facebook.errors}"
  # end

  should "connect to the open graph" do
    assert @facebook.connected?, "Did not connect to the graph: #{@facebook.errors}"
  end

  # should "retrieve the about attribute from the page" do
  #   assert_equal "Live, improvised dance music from Philadelphia", @facebook.about
  # end

  # should "retrieve the bio attribute from the page" do
  #   refute_nil @facebook.bio
  # end

  # should "throw an error when attempting to access an attribute that doesn't exist" do
  #   assert_error @facebook.great_google_moogle, FacebookClient::AttributeNotFound
  # end
end
