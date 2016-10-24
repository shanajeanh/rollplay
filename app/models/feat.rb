class Feat < ActiveRecord::Base
  belongs_to :character

  validates :title, presence: true
  validates :type, presence: true
  validates :summary, presence: true
end
