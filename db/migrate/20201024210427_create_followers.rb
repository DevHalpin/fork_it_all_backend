class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.string :following_user_id
      t.string :integer
      t.references :users, index: true, foreign_key: true

      t.timestamps
    end
  end
end
