class Users::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def update
    # byebug
    notification = current_user.notifications.find(params[:post_id])
    notification.update(read: true)
    redirect_to post_path(notification.post.id)
  end
end
