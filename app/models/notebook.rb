class Notebook < ActiveRecord::Base
  belongs_to :user
  has_many :budget_items, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user }
end
