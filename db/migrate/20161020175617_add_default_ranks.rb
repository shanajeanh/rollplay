class AddDefaultRanks < ActiveRecord::Migration[5.0]
  def up
    change_column_default :ranks, :added_ranks, 0
  end

  def down
    change_column_default :ranks, :added_ranks, nil
  end
end
