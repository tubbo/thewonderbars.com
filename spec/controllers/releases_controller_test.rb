require 'test_helper'

describe ReleasesController do
  let(:release) { FactoryGirl.create :extended_play_release }

  it "returns all releases" do
    get :index

    response.should be_success
  end

  it "shows a single release" do
    get :show, id: release.id

    response.should be_success
  end
end
