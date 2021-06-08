class TagMap < ApplicationRecord
  belongs_to :post_image, dependent: :destroy
  belongs_to :tag, dependent: :destroy

  validates :post_image_id, uniqueness: { scope: :tag_id }
end
