class Character < ActiveRecord::Base
  has_many :ranks
  has_many :skills, through: :ranks

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
      str: str_mod,
      dex: dex_mod,
      con: con_mod,
      int: int_mod,
      wis: wis_mod,
      cha: cha_mod
    }
  end
end
