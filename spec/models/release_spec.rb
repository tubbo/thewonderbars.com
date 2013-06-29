require 'spec_helper'

describe Release do
  let(:blank_release) { FactoryGirl.create :release }
  let(:release) { FactoryGirl.create :extended_play_release }

  it "validates all required fields" do
    release.should be_valid
  end

  it "accurately reports whether release notes are included" do
    release.should have_notes
    blank_release.should_not have_notes
  end

  it "accurately reports whether track information is included" do
    release.should have_track_information
    blank_release.should_not have_track_information
  end
end
