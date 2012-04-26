require 'test_helper'

class FacebookConfigurationTest < ActiveSupport::TestCase
  should "have an application ID" do
    refute_equal "", Facebook::APP_ID
    refute_nil Facebook::APP_ID
    refute_empty Facebook::APP_ID
  end

  should "have an application secret key" do
    refute_equal "", Facebook::SECRET
    refute_nil Facebook::SECRET
    refute_empty Facebook::SECRET
  end
end
