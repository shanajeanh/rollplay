class CreateFeats < ActiveRecord::Migration[5.0]
  def change
    create_table :feats do |t|
      t.string :title, null: false
      t.string :type, null: false
      t.string :summary, null: false
      t.string :prerequisites
      t.text :description
      t.text :benefit
      t.text :special

      t.belongs_to :character
    end
  end
end
