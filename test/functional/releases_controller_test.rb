require 'test_helper'

class ReleasesControllerTest < ActionController::TestCase
  setup do
    @controller = ReleasesController.new
    @release = FactoryGirl.create :extended_play_release
  end

  context "ReleasesController#show" do
    setup { get :show, id: @release.id }

    test "shows all required attributes in a table" do
      get :show, id: @release.id

      assert_response :success
      assert_select "table"
    end

    test "parses track listing into html from markdown" do
      assert_response :success
      assert_select ".tracks"
      assert_select ".tracks ol"
    end

    test "parses notes into html from markdown" do
      assert_response :success
      assert_select ".notes"
      assert_select ".notes p"
      assert_select ".notes h3"
      assert_select ".notes ul"
    end
  end

  context "ReleasesController#index" do
    setup { get :index }

    test "shows all releases in a smaller table" do
      assert_response :success
      assert_select "h2", "All Releases"
    end
  end
end
