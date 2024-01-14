class PostCode < ApplicationRecord
  belongs_to :post

  validates :code, presence: true
  validates :position, presence: true

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
  end
end
