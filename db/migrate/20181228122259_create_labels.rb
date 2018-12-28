class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :name
      t.integer :q_types
      t.integer :max
      t.timestamps
    end
  end
end

=begin
q_types 対応表
1 5choice
2 enterybox
=end