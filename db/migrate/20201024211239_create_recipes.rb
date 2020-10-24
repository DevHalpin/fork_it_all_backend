class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes, id: :string do |t|
      t.string :name
      t.string :region
      t.text :instructions
      t.string :meal_image
      t.string :meal_type
      t.string :video_url

      t.timestamps
    end
  end
end
