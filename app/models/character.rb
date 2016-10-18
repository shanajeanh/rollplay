class Character < ActiveRecord::Base
  validates :name, presence: true
  validates :character_class, presence: true
  validates :character_race, presence: true
end
