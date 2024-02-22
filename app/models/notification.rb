class Notification < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  def message
    if notifiable_type === "Comment"
      "#{notifiable.user.account_name}さんが#{notifiable.post.title}へコメントしました。"
    end
  end

  def notifiable_path
    if notifiable_type === "Comment"
      post_notifications_path(notifiable.post.id)
      # post_path(notifiable.post.id)
    end
  end
end
