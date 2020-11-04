class AddApiKeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :access_token, :string

    change_column :users, :access_token, :string, 
    unique: true, null: false
    
    add_index :users, :access_token, unique: true
  end
end