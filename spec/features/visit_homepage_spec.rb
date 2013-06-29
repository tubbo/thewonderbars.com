require 'spec_helper'

feature "Visiting the home page" do
  before { visit '/' }

  it "shows an empty desktop" do
    expect(page).to have_selector '#desktop'
  end
end
