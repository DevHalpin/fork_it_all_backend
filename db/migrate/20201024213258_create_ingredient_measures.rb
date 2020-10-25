class CreateIngredientMeasures < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_measures do |t|
      t.references :ingredients, index: true, foreign_key: true
      t.string :measure
      t.references :recipes, index: true

      t.timestamps
    end
  end
end
