class AddBab < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :bab, :integer, default: 0
  end
end
