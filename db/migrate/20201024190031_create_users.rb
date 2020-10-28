class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, :null => false
      t.string :profile_picture
      t.string :handle, :null => false

      t.timestamps
    end
  end
end
