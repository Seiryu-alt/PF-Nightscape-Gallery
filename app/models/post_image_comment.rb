class PostImageComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  has_many :notifications, dependent: :destroy

  counter_culture :post_image

  validates :user_id, presence: true
  validates :post_image_id, presence: true
  validates :comment, presence: true

  after_create do
    Notification.create_comment(visitor: user, visited: post_image.user, post_image_comment: self)
  end
end
