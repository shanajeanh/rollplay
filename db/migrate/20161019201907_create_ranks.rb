class CreateRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks do |t|
      t.boolean :class_skill, default: false
      t.integer :added_ranks
      t.belongs_to :character, null: false
      t.belongs_to :skill, null: false
    end
  end
end
