class CreateSpells < ActiveRecord::Migration[5.0]
  def change
    create_table :spells do |t|
      t.string :title, null: false
      t.string :level, null: false
      t.string :summary, null: false
      t.string :range, null: false
      t.string :duration
      t.string :save
      t.text :description

      t.belongs_to :character
    end
  end
end
