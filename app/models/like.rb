class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  counter_culture :post_image

  validates :user_id, presence: true
  validates :post_image_id, presence: true
  validates :post_image_id, uniqueness: { scope: :user_id }
end
