require "rails_helper"

RSpec.describe "Creating a budget item for a notebook" do
  let(:user) { create(:user) }
  let!(:first_notebook) { create(:notebook, name: "My first notebook", user: user) }

  before do
    sign_in_as user
  end

  describe "on the notebooks listing" do
    it "has button to create a budget item" do
      within("#notebook_#{first_notebook.id}") do
        expect(page).to have_css "a.new-budget-item", text: "Add budget item for this notebook"
      end
    end
  end
end

