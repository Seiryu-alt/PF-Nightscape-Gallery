class PostImage < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :post_image_comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy

  attachment :image_id

  # シャッタースピードの正規表現 ex."20", "1/30"
  SS_REGEXP = %r{\A([1-9][0-9]*(\.[0-9]+)?\z|1/[1-9][0-9]*)\z}.freeze
  validates :iso, numericality: { greater_than: 0, only_integer: true }
  validates :aperture, numericality: { greater_than: 0 }
  validates :shutter_speed, format: { with: SS_REGEXP, message: "シャッタースピードは0以上の数値または分数で入力してください" }
  validates :user_id, presence: true
  validates :image_id, presence: true
end
