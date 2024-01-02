class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :genres
  has_many :post_codes, dependent: :destroy

  validates :title, presence: true
  validates :main_code, presence: true
end
