class TagMap < ApplicationRecord
  belongs_to :post_image
  belongs_to :tag

  validates :post_image_id, uniqueness: { scope: :tag_id }
end
