class PostImageComment < ApplicationRecord
  belongs_to :post_image, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :comment, presence: true
end
