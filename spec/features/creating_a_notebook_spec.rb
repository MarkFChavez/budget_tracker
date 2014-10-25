require "rails_helper"

RSpec.describe "Creating a notebook" do
  let(:user) { create(:user) }

  context "signing in" do
    before do
      sign_in_as user
    end

    describe "creating a notebook" do
      before do
        click_on "Create notebook"

        fill_in "Name", with: "Credit Card"
        fill_in "Description", with: "credit card budget"
        click_on "Save"
      end

      it "shows it on the dashboard page" do
        within("#notebooks") do
          expect(page).to have_content "Credit Card"
          expect(page).to have_content "credit card budget"
        end
      end
    end
  end
end
