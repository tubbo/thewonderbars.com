require 'spec_helper'

feature "Discography" do
  fixtures :releases

  context "when viewed in full" do
    before { visit '/releases' }

    it "renders all releases in a table" do
      expect(page).to have_content 'All Releases'
      expect(page).to have_selector '#releases table'
    end
  end

  context "when viewed as a single release" do
    let(:release) { releases :just_the_start }
    before { visit "/releases/#{release.id}" }

    it "renders the title of the release" do
      expect(page).to have_content release.name
      expect(page).to have_content release.catalog_number
    end

    it "renders the album art image" do
      expect(page).to have_selector '.album_art img'
    end

    it "renders release details in a table" do
      expect(page).to have_selector '.details'
    end

    it "can be navigated to other releases"
  end
end
