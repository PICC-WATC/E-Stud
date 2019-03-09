class QuizExp < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_exp do |t|
      t.text :title
      t.text :explanation
      t.string :label
    end
  end
end
