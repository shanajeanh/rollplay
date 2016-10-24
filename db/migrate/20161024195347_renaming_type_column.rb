class RenamingTypeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :feats, :type, :feat_type
  end
end
