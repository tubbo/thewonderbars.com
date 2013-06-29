require 'spec_helper'

describe ReleasesController do
  fixtures :releases
  let(:release) { releases :just_the_start }

  it "returns all releases" do
    get :index

    response.should be_success
  end

  it "shows a single release" do
    get :show, id: release.id

    response.should be_success
  end
end
