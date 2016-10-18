class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.string :character_class, null: false
      t.string :character_race, null: false
      t.text :description

      t.timestamps
    end
  end
end
