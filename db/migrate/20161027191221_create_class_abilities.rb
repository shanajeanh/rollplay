class CreateClassAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :class_abilities do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.belongs_to :character
    end
  end
end
