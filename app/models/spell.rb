class Spell < ActiveRecord::Base
  belongs_to :character

  validates :title, presence: true
  validates :level, presence: true
  validates :summary, presence: true
  validates :range, presence: true
end
