class AddMoreStats < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :speed, :integer, default: 30
    add_column :characters, :hp, :integer
    add_column :characters, :fort, :integer, default: 0
    add_column :characters, :ref, :integer, default: 0
    add_column :characters, :will, :integer, default: 0
  end
end
