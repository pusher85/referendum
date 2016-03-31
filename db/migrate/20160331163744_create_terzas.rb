class CreateTerzas < ActiveRecord::Migration
  def change
    create_table :terzas do |t|
      t.integer :seggi_id
      t.integer :maschi
      t.integer :femmine

      t.timestamps null: false
    end
  end
end
