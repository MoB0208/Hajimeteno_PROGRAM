class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :posts
  has_many :notifications, dependent: :destroy

  validates :account_name, uniqueness: true

  def active_for_authentication?
    super && (status == true)
  end

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
