class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :campus
      t.string :day
      t.string :time
      t.integer :teacher_id
      t.integer :student_id
      t.timestamps null: false
    end
  end
end
