class Skill < ActiveRecord::Base
  has_many :ranks
  # has_many :characters, through: :ranks

  # scope :rank, -> { where(character: ) }
  validates :name, presence: true
  validates :ability, presence: true

  def ability_mod(character)
    character.abilities[ability]
  end
end
