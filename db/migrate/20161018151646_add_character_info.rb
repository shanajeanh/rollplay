class AddCharacterInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :level, :integer
    add_column :characters, :appearance, :text
    add_column :characters, :alignment, :string
    add_column :characters, :deity, :string
    add_column :characters, :size, :string, default: 'Medium'
  end
end
