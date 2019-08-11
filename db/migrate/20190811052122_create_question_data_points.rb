class CreateQuestionDataPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :question_data_points do |t|
      t.references :question, null: false, foreign_key: true
      t.references :data_point, null: false, foreign_key: true

      t.timestamps
    end
  end
end
