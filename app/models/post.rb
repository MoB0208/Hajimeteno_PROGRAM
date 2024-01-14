class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :genres
  has_many :post_codes, dependent: :destroy
  has_many :contents, dependent: :destroy
  has_many :main_texts, dependent: :destroy

  validates :title, presence: true
  validates :main_code, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
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
