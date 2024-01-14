class Content < ApplicationRecord
  belongs_to :post

  validates :table_of_content, presence: true

  def self.search_for(content, method)
    if method == 'perfect'
      PostCode.where(table_of_content: content)
    elsif method == 'forward'
      PostCode.where('table_of_content LIKE ?', content+'%')
    elsif method == 'backward'
      PostCode.where('table_of_content LIKE ?', '%'+content)
    else
      PostCode.where('table_of_content LIKE ?', '%'+content+'%')
    end
  end
end
