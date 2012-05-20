require 'test_helper'

class FacebookClientTest < ActiveSupport::TestCase
  setup {
    VCR.use_cassette(:facebook) do
      @facebook = FacebookClient.new
    end
  }

  should "get the page name as a string" do
    assert_equal "The Wonder Bars", @facebook.name
  end
end
