require 'test_helper'

describe "Release", ActiveSupport::TestCase do
  setup {
    @release = FactoryGirl.create :extended_play_release
    @blank_release = FactoryGirl.create :release
  }

  it "validates all required fields" do
    @release.valid?, "Validation failed: #{@release.errors.full_messages.join(', ')}".should.not == nil
  end

  it "accurately reports whether release notes are included" do
    @release.has_notes?, "Release doesn't have notes attached to it.".should.not == nil
    refute @blank_release.has_notes?, "Blank release has notes attached to it."
  end

  it "accurately reports whether track information is included" do
    @release.has_track_information?, "Release doesn't have track information.".should.not == nil
    refute @blank_release.has_track_information?, "Blank release has track information."
  end
end
