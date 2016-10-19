class RemoveSkillDescription < ActiveRecord::Migration[5.0]
  def up
    remove_column :skills, :description
  end

  def down
    add_column :skills, :description, :string, null: false
  end
end
