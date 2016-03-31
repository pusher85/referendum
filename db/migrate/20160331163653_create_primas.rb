class CreatePrimas < ActiveRecord::Migration
  def change
    create_table :primas do |t|
      t.integer :seggi_id
      t.integer :maschi
      t.integer :femmine

      t.timestamps null: false
    end
  end
end
