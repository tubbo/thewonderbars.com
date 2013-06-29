require 'spec_helper'

describe ReleaseDecorator do
  fixtures :releases
  subject { ReleaseDecorator.decorate releases(:just_the_start) }

  it "renders the name and catalog number in a single string" do
    expect(subject.name_and_catalog_number).to eq("(WXP-001) Just The Start EP")
  end

  it "formats the date accordingly" do
    expect(subject.date).to eq("August 25, 2012")
  end
end
