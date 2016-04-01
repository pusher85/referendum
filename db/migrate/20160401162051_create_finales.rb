class CreateFinales < ActiveRecord::Migration
  def change
    create_table :finales do |t|
      t.integer :seggi_id
      t.integer :si
      t.integer :no
      t.integer :bianche
      t.integer :nulle
      t.integer :contestate

      t.timestamps null: false
    end
  end
end
