require "rails_helper"

RSpec.describe Notebook do
  describe "validations" do
    before do
      @params = { name: "My notebook", description: "summary of my notebook" }
    end

    it "requires name" do
      notebook = Notebook.new(@params.merge(name: ""))
      expect(notebook).not_to be_valid
    end

    it "name should not be unique on different users" do
      user1 = create(:user)
      user2 = create(:user)
      notebook_for_user1 = create(:notebook, name: "Notebook 1", user: user1)

      notebook = Notebook.new(@params.merge(name: "Notebook 1", user: user2))
      expect(notebook).to be_valid
    end

    it "name should be unique per user" do
      user = create(:user)
      notebook = create(:notebook, name: "This is a notebook", user: user)

      notebook = Notebook.new(@params.merge(name: "This is a notebook", user: user))
      expect(notebook).not_to be_valid
    end

    it "does not require description" do
      notebook = Notebook.new(@params.merge(description: ""))
      expect(notebook).to be_valid
    end
  end
end
