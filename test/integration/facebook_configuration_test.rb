require 'test_helper'

class FacebookConfigurationTest < ActiveSupport::TestCase
  {
    page_id: Facebook::PAGE_ID,
    application_id: Facebook::APP_ID,
    secret_key: Facebook::SECRET
  }.each { |attribute, setting|
    an = attribute == :application_id ? "a" : "an"

    should "have #{an} #{attribute}" do
      %w(equal nil empty).each { |question|
        if question == 'equal'
          refute_equal "", setting
        else
          self.send :"refute_#{question}", setting
        end
      }
    end
  }
end
