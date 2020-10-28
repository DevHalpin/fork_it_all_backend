class AddReferenceToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :twists, :recipes
  end
end
