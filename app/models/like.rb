class Like < ApplicationRecord
  before_save :check_user
  before_destroy :check_user

  belongs_to :user
  belongs_to :post_image

  validates :user_id, presence: true
  validates :post_image_id, presence: true
  validates :post_image_id, uniqueness: { scope: :user_id }

  private

  def check_user
    current_user.id == user_id
  end
end
