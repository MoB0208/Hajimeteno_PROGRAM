class MainText < ApplicationRecord
  belongs_to :post

  validates :body, presence: true

  def self.search_for(content, method)
    if method == 'perfect'
      PostCode.where(body: content)
    elsif method == 'forward'
      PostCode.where('body LIKE ?', content+'%')
    elsif method == 'backward'
      PostCode.where('body LIKE ?', '%'+content)
    else
      PostCode.where('body LIKE ?', '%'+content+'%')
    end
  end
end
