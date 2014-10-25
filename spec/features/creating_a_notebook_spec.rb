require "rails_helper"

RSpec.describe "Creating a notebook" do
  let(:user) { create(:user) }

  describe "displaying notebooks" do
    before do
      @some_user = create(:user)
      @not_your_notebook = create(:notebook, name: "Not your notebook", user: @some_user)
      @your_notebook = create(:notebook, name: "Your notebook", user: user)

      sign_in_as user
    end

    it "does not show notebooks you did not created" do
      within("#notebooks") do
        expect(page).to have_content "Your notebook"
        expect(page).not_to have_content "Not your notebook"
      end
    end
  end

  describe "creating a notebook" do
    before do
      sign_in_as user
    end

    describe "that passes validation" do
      before do
        create_valid_notebook
      end

      it "shows it on the dashboard page" do
        within("#notebooks") do
          expect(page).to have_content "Credit Card"
          expect(page).to have_content "credit card budget"
        end
      end

      it "shows a successful message" do
        expect(page).to have_content "Notebook created"
      end
    end

    describe "that failed validation" do
      before do
        create_invalid_notebook
      end

      it "shows an error message" do
        expect(page).to have_content "Name can't be blank"
      end
    end
  end
end
