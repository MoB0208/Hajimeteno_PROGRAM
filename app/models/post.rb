class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy
  has_many :genre_posts, dependent: :destroy
  has_many :genres, through: :genre_posts
  has_many :post_codes, dependent: :destroy
  has_many :contents, dependent: :destroy
  has_many :main_texts, dependent: :destroy

  has_many :reverse_of_post_relationships, class_name: "PostRelationship", foreign_key: "relation_post_id", dependent: :destroy
  has_many :posts, through: :reverse_of_post_relationships, source: :post
  has_many :post_relationships, class_name: "PostRelationship", foreign_key: "post_id", dependent: :destroy
  has_many :relation_posts, through: :post_relationships, source: :relation_post
  # postは投稿する記事または閲覧する記事
  # relation_postは関連記事

  validates :title, presence: true
  validates :main_code, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 関連記事として紐づけたときの処理
  def relation(post_id)
    post_relationships.create(relation_post_id: post_id)
  end
  # 関連記事から紐づけを外すときの処理
  def unrelation(post_id)
    post_relationships.find_by(relation_post_id: post_id).destroy
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(title: content)
    elsif method == 'forward'
      Post.where('title LIKE ? OR main_code LIKE ?', content + '%', content + '%')
    elsif method == 'backward'
      Post.where('title LIKE ? OR main_code LIKE ?', '%' + content, '%' + content)
    else
      Post.where('title LIKE ? OR main_code LIKE ?', '%' + content + '%', '%' + content + '%')
    end
  end
  
  after_create do
    user.comments.each do |comment|
      notifications.create(user_id: comment.id)
    end
  end

  # キーワード検索アップグレード用現在模索中につきコメントアウト
  # def self.search_for(content, method)
  #   if method == 'perfect'
  #     Post.joins(:content, :main_text, :post_code).where('title LIKE(?) OR main_code LIKE(?) OR contents.table_of_content LIKE(?) OR main_texts.body LIKE(?) OR post_codes.code LIKE(?)', content, content, content, content, content)
  #   elsif method == 'forward'
  #     Post.joins(:content, :main_text, :post_code).where('title LIKE(?) OR main_code LIKE(?) OR contents.table_of_content LIKE(?) OR main_texts.body LIKE(?) OR post_codes.code LIKE(?)', content+'%', content+'%', content+'%', content+'%', content+'%')
  #   elsif method == 'backward'
  #     Post.joins(:content, :main_text, :post_code).where('title LIKE(?) OR main_code LIKE(?) OR contents.table_of_content LIKE(?) OR main_texts.body LIKE(?) OR post_codes.code LIKE(?)', '%'+content, '%'+content, '%'+content, '%'+content, '%'+content)
  #   else
  #     Post.joins(:content, :main_text, :post_code).where('title LIKE(?) OR main_code LIKE(?) OR contents.table_of_content LIKE(?) OR main_texts.body LIKE(?) OR post_codes.code LIKE(?)', '%'+content+'%', '%'+content+'%', '%'+content+'%', '%'+content+'%', '%'+content+'%')
  #   end
  # end
end
