class AddSeggiIdToRilevazionis < ActiveRecord::Migration
  def change
    add_column :rilevazionis, :seggi_id, :integer
  end
end
