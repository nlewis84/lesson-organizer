class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :grade
      t.string :email
      t.integer :teacher_id
      t.integer :admin_id
      t.timestamps null: false
    end
  end
end
