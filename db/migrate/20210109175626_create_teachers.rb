class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.integer :admin_id
      t.timestamps null: false
    end
  end
end
