class AddCasterToCharacter < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :caster, :boolean, default: false
  end
end
