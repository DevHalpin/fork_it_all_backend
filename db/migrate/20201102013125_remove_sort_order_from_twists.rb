class RemoveSortOrderFromTwists < ActiveRecord::Migration[5.2]
  def change
    remove_column :twists, :sort_order # will also remove the index
  end
end
