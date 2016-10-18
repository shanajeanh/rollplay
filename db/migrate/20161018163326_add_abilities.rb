class AddAbilities < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :str, :integer, default: 10
    add_column :characters, :dex, :integer, default: 10
    add_column :characters, :con, :integer, default: 10
    add_column :characters, :int, :integer, default: 10
    add_column :characters, :wis, :integer, default: 10
    add_column :characters, :cha, :integer, default: 10
  end
end
