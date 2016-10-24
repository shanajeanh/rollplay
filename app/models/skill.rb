class Skill < ActiveRecord::Base
  has_many :ranks

  validates :name, presence: true
  validates :ability, presence: true

  def ability_mod(character)
    character.abilities[ability]
  end
end
