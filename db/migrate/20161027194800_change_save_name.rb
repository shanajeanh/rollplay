class ChangeSaveName < ActiveRecord::Migration[5.0]
  def change
    rename_column :spells, :save, :spell_save
  end
end
