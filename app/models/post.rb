class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
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

  # フォローしたときの処理
  def relation(post_id)
    post_relationships.create(relation_post_id: post_id)
  end
  # フォローを外すときの処理
  def unrelation(post_id)
    post_relationships.find_by(relation_post_id: post_id).destroy
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(title: content)
    elsif method == 'forward'
      Post.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Post.where('title LIKE ?', '%'+content)
    else
      Post.where('title LIKE ?', '%'+content+'%')
    end

    if method == 'perfect'
      Post.where(main_code: content)
    elsif method == 'forward'
      Post.where('main_code LIKE ?', content+'%')
    elsif method == 'backward'
      Post.where('main_code LIKE ?', '%'+content)
    else
      Post.where('main_code LIKE ?', '%'+content+'%')
    end
  end
end
