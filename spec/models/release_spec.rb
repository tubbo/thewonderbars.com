require 'spec_helper'

describe Release do
  fixtures :releases
  let(:blank_release) { Release.new }
  let(:release) { releases :just_the_start }

  it "validates all required fields" do
    release.should be_valid
    blank_release.should_not be_valid
  end

  it "accurately reports whether release notes are included" do
    release.should have_notes
    blank_release.should_not have_notes
  end

  it "accurately reports whether track information is included" do
    release.should have_track_information
    blank_release.should_not have_track_information
  end

  it "includes album artwork" do
    release.artwork.should_not be_blank
  end
end
