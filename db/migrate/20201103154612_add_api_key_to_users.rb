class AddApiKeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :access_token, :string

    User.find_each do |am|
      access_token = SecureRandom.hex
      am.update_columns(access_token: access_token)
    end

    change_column :users, :access_token, :string, 
    unique: true, null: false
    
    add_index :users, :access_token, unique: true
  end
end