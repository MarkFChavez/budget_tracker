class BudgetItem < ActiveRecord::Base
  belongs_to :notebook

  validates :name, :amount, presence: true
end
