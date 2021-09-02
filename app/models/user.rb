class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :relationships, class_name: "Relationships", foreign_key: "follower_id", dependent: :destroy
  has_many :following,through: :relationships, source: :followed

  attachment :profile_image

  def already_liked?(book)
    self.favorites.exists?(book_id: book.id)
  end

  validates :name, {uniqueness: true, length: {in: 2..20}}
  validates :introduction, length: {maximum:50}

end
