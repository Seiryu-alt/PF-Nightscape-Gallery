class Tag < ApplicationRecord
  has_many :tag_maps

  validates :mame, presence: true, uniqueness: true
end
