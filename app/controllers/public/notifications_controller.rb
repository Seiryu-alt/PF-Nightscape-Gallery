class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!
  after_action :mark_notification

  def index
    @notifications = current_user.passive_notifications.includes(:visited, :visitor).page(params[:page]).per(10)
  end

  def mark_notification
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
