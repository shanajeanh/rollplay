class AddUserToCharacter < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :user_id, :integer, null: false
  end
end
