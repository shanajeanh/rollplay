class CreateWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :weapons do |t|
      t.string :name, null: false
      t.string :damage, null: false
      t.integer :bonus, default: 0
      t.string :crit
      t.string :range
      t.string :size, default: 'Medium'
      t.string :damage_type
      t.text :special
      t.boolean :use_dex, default: false

      t.belongs_to :character
    end
  end
end
