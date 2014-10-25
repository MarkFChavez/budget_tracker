module NotebookHelper
  def create_valid_notebook
    click_on "Create notebook"
    fill_in "Name", with: "Credit Card"
    fill_in "Description", with: "credit card budget"
    click_on "Save"
  end

  def create_invalid_notebook
    click_on "Create notebook"
    fill_in "Name", with: ""
    fill_in "Description", with: "invalid notebook"
    click_on "Save"
  end
end

RSpec.configure do |config|
  config.include NotebookHelper
end
