class RemoveNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :access_token, :string, :null => true
  end
end
