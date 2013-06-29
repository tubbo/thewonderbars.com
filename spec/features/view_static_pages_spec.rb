require 'spec_helper'

feature "Static pages" do

  context "for the shows listing" do
    before { visit '/shows' }

    it "renders a title and some greeting text" do
      expect(page).to have_content "Wanna come see us play?"
    end

    it "renders the upcoming shows table"
    it "renders the past shows table"
  end

  context "for the contact page" do
    before do
      VCR.use_cassette :facebook_authentication do
        visit '/contact'
      end
    end

    it "renders the static content" do
      expect(page).to have_content 'Contact The Wonder Bars'
    end
  end
end
