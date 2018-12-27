class AddColumnChoice < ActiveRecord::Migration[5.2]
  def up
    add_column :choices, :select, :text
  end

  def down
    remove_column :choices, :select, :text
  end
end
