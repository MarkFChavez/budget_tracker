require "rails_helper"

RSpec.describe "Logging in" do
  let(:valid_user) { create(:user) }    
  let(:invalid_user) { build(:user) }

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

  describe "with invalid credentials" do
    before do
      sign_in_as invalid_user
    end

    it "does not log you in" do
      expect(page).to have_content "Invalid email or password"
    end
  end
end


