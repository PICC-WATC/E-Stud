class CreateUserQuizData < ActiveRecord::Migration[5.2]
  def change
    create_table :user_quiz_data do |t|
      t.integer :usr_id
      t.integer :q_id
      t.integer :continuity
      t.integer :correct
      t.integer :miss
      t.boolean :clear
      t.timestamps
    end
  end
end
