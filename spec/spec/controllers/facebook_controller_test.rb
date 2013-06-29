require 'test_helper'

describe "FacebookController", ActionController::TestCase do
  setup do
    VCR.use_cassette :facebook_authentication do
      @controller = FacebookController.new
    end
  end

  it "access the bio page" do
    VCR.use_cassette :facebook_authentication do
      get :about_us
      response.success?.should.not == nil
    end
  end

  it "access the contact page" do
    VCR.use_cassette :facebook_authentication do
      get :contact
      response.success?.should.not == nil
    end
  end
end
