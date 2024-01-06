class PostCode < ApplicationRecord
  belongs_to :post

  validates :code, presence: true
  validates :body, presence: true

  def self.search_for(content, method)
    if method == 'perfect'
      PostCode.where(code: content)
    elsif method == 'forward'
      PostCode.where('code LIKE ?', content+'%')
    elsif method == 'backward'
      PostCode.where('code LIKE ?', '%'+content)
    else
      PostCode.where('code LIKE ?', '%'+content+'%')
    end

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
