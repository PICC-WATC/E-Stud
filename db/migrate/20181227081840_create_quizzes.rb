class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.text :q_text
      t.text :answer
      t.integer :choice_id
      t.string :q_type
      t.string :label
      t.timestamps
    end
  end
end 

