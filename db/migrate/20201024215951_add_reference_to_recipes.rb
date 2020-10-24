class AddReferenceToRecipes < ActiveRecord::Migration[5.2]
  def change
    change_column :twists, :recipe_id, :string
    add_foreign_key :twists, :recipes
  end
end
