class Rank < ActiveRecord::Base
  belongs_to :character
  belongs_to :skill

  def ability_mod
    character.abilities[skill.ability.to_sym]
  end
end
