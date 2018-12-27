class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.text :choice_1
      t.text :choice_2
      t.text :choice_3
      t.text :choice_4
      t.text :choice_5
      t.timestamps
    end
  end
end
