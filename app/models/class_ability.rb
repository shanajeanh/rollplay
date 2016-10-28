class ClassAbility < ActiveRecord::Base
  belongs_to :character

  validates :title, presence: true
  validates :description, presence: true
end
