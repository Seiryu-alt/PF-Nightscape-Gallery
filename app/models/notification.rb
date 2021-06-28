class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :visitor, class_name: 'User'
  belongs_to :visited, class_name: 'User'
  belongs_to :post_image, optional: true
  belongs_to :post_image_comment, optional: true

  validate :visitor_is_not_visited

  enum action: { follow: 0, like: 1, comment: 2 }

  def visitor_is_not_visited
    errors.add(:visitor, "visitor_idとvisited_idは異なる必要があります") if visitor == visited
  end

  def self.create_follow(visitor:, visited:)
    notification = Notification.find_by(visitor_id: visitor.id,
                                        visited_id: visited.id,
                                        action: 'follow',
                                        checked: false)
    return if notification.present?

    Notification.create(
      visitor_id: visitor.id,
      visited_id: visited.id,
      action: 'follow'
    )
  end

  def self.create_like(visitor:, visited:, post_image:)
    notification = Notification.find_by(visitor_id: visitor.id,
                                        visited_id: visited.id,
                                        post_image_id: post_image.id,
                                        action: 'like',
                                        checked: false)
    return if notification.present?

    Notification.create(
      visitor_id: visitor.id,
      visited_id: visited.id,
      post_image_id: post_image.id,
      action: 'like'
    )
  end

  def self.create_comment(visitor:, visited:, post_image_comment:)
    Notification.create(
      visitor_id: visitor.id,
      visited_id: visited.id,
      post_image_comment_id: post_image_comment.id,
      action: 'comment'
    )
  end
end
