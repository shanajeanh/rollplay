class Skill < ActiveRecord::Base
  has_many :ranks
  has_many :users, through: :ranks

  validates :name, presence: true
  validates :ability, presence: true
end
