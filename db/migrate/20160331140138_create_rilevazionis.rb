class CreateRilevazionis < ActiveRecord::Migration
  def change
    create_table :rilevazionis do |t|
      t.references :seggi, index: true, foreign_key: true
      t.integer :uno_m
      t.integer :uno_f
      t.integer :due_m
      t.integer :due_f
      t.integer :tre_m
      t.integer :tre_f

      t.timestamps null: false
    end
  end
end
