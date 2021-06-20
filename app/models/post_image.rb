class PostImage < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :post_image_comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  attachment :image, destroy: true, content_type: ["image/jpeg", "image/png"]

  validates :user_id, presence: true
  validates :image, presence: true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def add_tag(tag_name)
    tag = Tag.find_by(name: tag_name)
    tag = Tag.create(name: tag_name) unless tag
    TagMap.create(post_image_id: id, tag_id: tag.id)
  end

  def remove_tag(tag_name)
    tag = Tag.find_by(name: tag_name)
    tag_map = TagMap.find_by(post_image_id: id, tag_id: tag.id)
    tag_map.destroy
  end

  def update_tag_from_list(tag_list)
    tag_names = tag_list.split(',')
    tag_names.each do |tag_name|
      add_tag(tag_name)
    end
    # byebug
    tags.each do |tag|
      remove_tag(tag.name) unless tag_names.include?(tag.name)
    end
  end

  def location?
    location_name.present? && latitude.present? && longitude.present?
  end
end
