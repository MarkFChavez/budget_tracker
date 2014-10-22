require "rails_helper"

RSpec.describe "Logging in" do
  let(:valid_user) { create(:user) } 

  describe "with valid credentials" do
    before do
      sign_in_as valid_user
    end

    it "logs you in" do
      expect(page).to have_content "Signed in successfully"
    end

    it "shows you the dashboard" do
      expect(page).to have_content "Dashboard"
    end
  end
end

