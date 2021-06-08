class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post_image

  validates :post_image_id, uniqueness: { scope: :user_id }
end
