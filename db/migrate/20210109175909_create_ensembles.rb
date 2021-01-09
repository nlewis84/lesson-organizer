class CreateEnsembles < ActiveRecord::Migration
  def change
    create_table :ensembles do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
