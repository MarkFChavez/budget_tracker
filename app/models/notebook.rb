class Notebook < ActiveRecord::Base
  belongs_to :user
  has_many :budget_items, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user }

  def total_amount
    budget_items.inject(0) do |sum, item|
      sum += item.amount
      sum
    end
  end
end
