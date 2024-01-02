class PostCode < ApplicationRecord
  belongs_to :post

  validates :code, presence: true
  validates :body, presence: true
end
