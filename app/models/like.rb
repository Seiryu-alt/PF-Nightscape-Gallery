class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  counter_culture :post_image

  validates :user_id, presence: true
  validates :post_image_id, presence: true
  validates :post_image_id, uniqueness: { scope: :user_id }

  after_create do
    Notification.create_like(visitor: user, visited: post_image.user, post_image: post_image)
  end
end
