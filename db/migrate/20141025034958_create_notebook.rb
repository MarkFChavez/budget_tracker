class CreateNotebook < ActiveRecord::Migration
  def change
    create_table :notebooks do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :user_id, :integer

      t.timestamps
    end

    add_index :notebooks, :user_id
  end
end
