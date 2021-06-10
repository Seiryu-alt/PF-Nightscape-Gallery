class PostImageComment < ApplicationRecord
  before_save :check_user
  before_destroy :check_user

  belongs_to :post_image
  belongs_to :user

  validates :user_id, presence: true
  validates :post_image_id, presence: true
  validates :comment, presence: true

  private

  def check_user
    current_user.id == user_id
  end
end
