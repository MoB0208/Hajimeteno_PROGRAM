class Genre < ApplicationRecord
  has_many :genre_posts, dependent: :destroy
  has_many :posts, through: :genre_posts

end
