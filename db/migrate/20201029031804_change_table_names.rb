class ChangeTableNames < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :twists_id # will also remove the index
    remove_column :favorites, :users_id # will also remove the index
  end
end
