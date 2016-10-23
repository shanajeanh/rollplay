class AllowNullCharactersForRanks < ActiveRecord::Migration[5.0]
  def up
    change_column :ranks, :character_id, :integer, null: true
  end

  def down
    change_column :ranks, :character_id, :integer, null: false
  end
end
