class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :label
      t.string :q_type
      t.timestamps
    end
  end
end
