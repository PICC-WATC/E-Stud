class CreateQuizExps < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_exps do |t|
      t.text :title
      t.text :explanation
      t.string :label
      t.timestamps
    end
  end
end
