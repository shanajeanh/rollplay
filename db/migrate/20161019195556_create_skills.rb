class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.string :ability, null: false
      t.text :description, null: false
    end
  end
end
