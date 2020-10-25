class AddColumnsToTwistsReferenceKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :twists, :recipe_id, index: true
    add_foreign_key :twists, :recipes
  end
end
