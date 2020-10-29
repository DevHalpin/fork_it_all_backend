class AddColumns < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :twist, index: true # will also remove the index
    add_reference :favorites, :user, index: true # will also remove the index
  end
end
