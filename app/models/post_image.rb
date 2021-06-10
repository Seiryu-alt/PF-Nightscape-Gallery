class PostImage < ApplicationRecord
  before_save :check_user
  before_destroy :check_user

  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :post_image_comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  attachment :image_id

  # シャッタースピードの正規表現 ex."20", "1/30"
  SS_REGEXP = %r{\A([1-9][0-9]*(\.[0-9]+)?\z|1/[1-9][0-9]*)\z}.freeze
  validates :iso, numericality: { greater_than: 0, only_integer: true }
  validates :aperture, numericality: { greater_than: 0 }
  validates :shutter_speed, format: { with: SS_REGEXP, message: "シャッタースピードは0以上の数値または分数で入力してください" }
  validates :user_id, presence: true
  validates :image_id, presence: true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def add_tag(tag_name)
    tag = Tag.find_by(name: tag_name)
    tag = Tag.create(name: tag_name) unless tag
    TagMap.create(post_iamge_id: id, tag_id: tag.id)
  end

  def remove_tag(tag_name)
    tag = Tag.find_by(name: tag_name)
    tag_map = TagMap.find_by(tag_id: tag.id)
    tag_map.destroy
  end

  def update_tag_from_list(tag_list)
    tag_names = tag_list.split(',')
    tag_names.each do |tag_name|
      add_tag(tag_name)
    end
    tags.each do |tag|
      remove_tag(tag.name) unless tag_names.include?(tag.name)
    end
  end

  private

  def check_user
    current_user.id == user_id
  end
end
