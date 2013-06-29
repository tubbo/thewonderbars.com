require 'spec_helper'

describe FacebookController do
  before do
    VCR.use_cassette :facebook_authentication do
      @controller = FacebookController.new
    end
  end

  it "accesses the bio page" do
    VCR.use_cassette :facebook_authentication do
      get :about_us
      response.success?.should.not == nil
    end
  end

  it "accesses the contact page" do
    VCR.use_cassette :facebook_authentication do
      get :contact
      response.success?.should.not == nil
    end
  end
end
