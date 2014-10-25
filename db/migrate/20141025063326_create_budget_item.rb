class CreateBudgetItem < ActiveRecord::Migration
  def change
    create_table :budget_items do |t|
      t.column :name, :string
      t.column :amount, :decimal
      t.column :notebook_id, :integer

      t.timestamps
    end

    add_index :budget_items, :notebook_id
  end
end
