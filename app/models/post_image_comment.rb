class PostImageComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  counter_culture :post_image

  validates :user_id, presence: true
  validates :post_image_id, presence: true
  validates :comment, presence: true
end
