class Like < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :post_image, dependent: :destroy
end
