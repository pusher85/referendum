class CreateSeggis < ActiveRecord::Migration
  def change
    create_table :seggis do |t|
      t.text :descrizione
      t.integer :numero
      t.integer :maschi
      t.integer :femmine

      t.timestamps null: false
    end
  end
end
