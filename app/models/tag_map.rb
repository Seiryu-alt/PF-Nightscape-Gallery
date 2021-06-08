class TagMap < ApplicationRecord
  belongs_to :post_image, dependent: :destroy
  belongs_to :tag, dependent: :destroy
end
