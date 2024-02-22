class Notification < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  def message
    if notifiable_type === "Comment"
      "投稿した#{notifiable.post.title}へ#{notifiable.user.account_name}さんがコメントしました。"
    end
  end

  def notifiable_path
    if notifiable_type === "Comment"
      post_path(notifiable.post.id)
    end
  end
end
