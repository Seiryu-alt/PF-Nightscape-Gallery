class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy

  validates :mame, presence: true, uniqueness: true
end
