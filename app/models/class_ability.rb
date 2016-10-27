class ClassAbility < ActiveRecord::Base
  belongs_to :character

  validates :title, presence: true
  validates :feat_type, presence: true
  validates :summary, presence: true
end
