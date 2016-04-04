class AddSpecialeToSeggis < ActiveRecord::Migration
  def change
    add_column :seggis, :speciale, :boolean
  end
end
