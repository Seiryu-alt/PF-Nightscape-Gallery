class PostImage < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_many :likes
  has_many :post_image_comments
  has_many :tag_maps 

  attachment :image_id

  # シャッタースピードの正規表現 ex."20", "1/30"
  SS_REGEXP = /\A([1-9][0-9]*(\.[0-9]+)?\z|1\/[1-9][0-9]*)\z/
  validates :iso,      numericality: { greater_than: 0, only_integer: true }
  validates :aperture, numericality: { greater_than: 0 }
  validates :shutter_speed, format: { with: SS_REGEXP, message: "シャッタースピードは0以上の数値または分数で入力してください" }
