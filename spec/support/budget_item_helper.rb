module BudgetItemHelper
  def create_valid_budget_item(notebook)
    within("#notebook_#{notebook.id}") do
      click_on "Add budget item for this notebook"
    end

    fill_in "Name", with: "Upcase Subscription (recurring)"
    fill_in "Amount", with: "1800.95"
    click_on "Add"
  end
end

RSpec.configure do |config|
  config.include BudgetItemHelper
end
