require "rails_helper"

RSpec.describe "Showing a notebook" do
  let(:user) { create(:user) }
  let!(:notebook) { create(:notebook, name: "My notebook", description: "my very first notebook", user: user) }
  let!(:budget_item) { create(:budget_item, name: "First budget item", amount: 300.00, notebook: notebook) }

  before do
    sign_in_as user
  end

  describe "going to the notebook's page" do
    before do
      within("#notebook_#{notebook.id}") do
        click_on "My notebook"
      end
    end

    it "shows the notebook details" do
      expect(current_path).to eq notebook_path(notebook)
      expect(page).to have_content "My notebook"
      expect(page).to have_content "my very first notebook"
    end

    it "shows how many budget items this notebook have" do
      expect(page).to have_content "1 item found"
    end
  end
end
