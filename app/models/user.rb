class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image

  def already_liked?(book)
    self.favorites.exists?(book_id: book.id)
  end

  validates :name, {uniqueness: true, length: {in: 2..20}}
  validates :introduction, length: {maximum:50}

end
