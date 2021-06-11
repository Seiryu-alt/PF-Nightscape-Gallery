class PostImageComment < ApplicationRecord
  belongs_to :post_image
  belongs_to :user

  validates :user_id, presence: true
  validates :post_image_id, presence: true
  validates :comment, presence: true
end
