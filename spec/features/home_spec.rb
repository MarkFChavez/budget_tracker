require "rails_helper"

RSpec.describe "Home" do
  it "has a title" do
    visit root_path
    expect(page).to have_title "Huddle | expense tracker"
  end
end
