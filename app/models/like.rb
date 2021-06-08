class Like < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :post_image, dependent: :destroy

  validates :post_image_id, uniqueness: { scope: :user_id }
end
