class CreateTwists < ActiveRecord::Migration[5.2]
  def change
    create_table :twists do |t|
      t.integer :recipe_id
      t.integer :user_id
      t.string :tags
      t.string :slug
      t.boolean :is_private
      t.integer :sort_order
      t.text :content

      t.timestamps
    end
  end
end
