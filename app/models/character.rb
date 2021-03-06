class Character < ActiveRecord::Base
  belongs_to :user
  has_many :feats, dependent: :destroy
  has_many :spells, dependent: :destroy
  has_many :class_abilities, dependent: :destroy
  has_many :weapons, dependent: :destroy
  has_many :ranks, dependent: :destroy
  has_many :skills, through: :ranks

  accepts_nested_attributes_for :ranks


  validates :name, presence: true
  validates :character_class, presence: true
  validates :character_race, presence: true

  def mod(ability)
    (ability - 10)/2
  end

  def str_mod
    mod(str)
  end

  def dex_mod
    mod(dex)
  end

  def con_mod
    mod(con)
  end

  def int_mod
    mod(int)
  end

  def wis_mod
    mod(wis)
  end

  def cha_mod
    mod(cha)
  end

  def abilities
    {
      'Str' => str_mod,
      'Dex' => dex_mod,
      'Con' => con_mod,
      'Int' => int_mod,
      'Wis' => wis_mod,
      'Cha' => cha_mod
    }
  end

  def rank(skill)
    Rank.find_or_create_by(skill: skill, character: self)
  end
end
