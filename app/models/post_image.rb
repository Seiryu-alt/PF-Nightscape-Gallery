class PostImage < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_many :likes
  has_many :post_image_comments
  has_many :tag_maps 

  attachment :image_id
end
