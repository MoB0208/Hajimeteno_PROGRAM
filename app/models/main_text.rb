class MainText < ApplicationRecord
  belongs_to :post

  validates :body, presence: true

  def self.search_for(content, method)
    if method == 'perfect'
      MainText.where(body: content)
    elsif method == 'forward'
      MainText.where('body LIKE ?', content+'%')
    elsif method == 'backward'
      MainText.where('body LIKE ?', '%'+content)
    else
      MainText.where('body LIKE ?', '%'+content+'%')
    end
  end
end
