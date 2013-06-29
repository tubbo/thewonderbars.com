require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase
  setup {
    @release = FactoryGirl.create :extended_play_release
    @blank_release = FactoryGirl.create :release
  }

  test "validates all required fields" do
    assert @release.valid?, "Validation failed: #{@release.errors.full_messages.join(', ')}"
  end

  test "accurately reports whether release notes are included" do
    assert @release.has_notes?, "Release doesn't have notes attached to it."
    refute @blank_release.has_notes?, "Blank release has notes attached to it."
  end

  test "accurately reports whether track information is included" do
    assert @release.has_track_information?, "Release doesn't have track information."
    refute @blank_release.has_track_information?, "Blank release has track information."
  end
end
