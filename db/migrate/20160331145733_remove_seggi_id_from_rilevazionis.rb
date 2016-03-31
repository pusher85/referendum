class RemoveSeggiIdFromRilevazionis < ActiveRecord::Migration
  def change
    remove_reference :rilevazionis, :seggi, index: true, foreign_key: true
  end
end
