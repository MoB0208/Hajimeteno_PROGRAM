class PostRelationship < ApplicationRecord
  # 関連記事用の中間テーブル
  belongs_to :post, class_name: "Post"
  # postは投稿する記事または閲覧する記事
  belongs_to :relation_post, class_name: "Post"
  # relation_postは関連記事
end
