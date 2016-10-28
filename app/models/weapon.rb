class Weapon < ActiveRecord::Base
  belongs_to :character

  validates :name, presence: true
  validates :damage, presence: true
end
