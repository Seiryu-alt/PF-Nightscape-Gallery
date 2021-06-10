class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy
  has_many :post_images, dependent: :destroy
  has_many :post_image_comments, dependent: :destroy

  has_many :active_relationships,  class_name: "Relationship",
                                   foreign_key: "follower_id",
                                   inverse_of: "follower",
                                   dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   inverse_of: "followed",
                                   dependent: :destroy
  has_many :following_users, through: :active_relationships,  source: :followed
  has_many :follower_users,  through: :passive_relationships, source: :follower

  attachment :profile_image_id

  validates :mame, presence: true
  validates :email, presence: true

  def follow(user)
    return if current_user == user || following_users.include?(user)

    Relationship.create(follower_id: current_user.id, followed_id: user.id)
  end

  def unfollow(user)
    return if following_users.exclude?(user)

    relationship = Relationship.find_by(follower_id: current_user.id, followed_id: user.id)
    relationship.destroy
  end

  def followed_by?(user)
    follower_users.include?(user)
  end

  def following?(user)
    following_users.include?(user)
  end
end
