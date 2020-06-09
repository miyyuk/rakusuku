class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :posts
  has_many :comments
  has_many :looks
  has_many :looked_posts, through: :looks, source: :post

  def name
    "#{self.lastname} #{self.firstname}"
  end

  def already_looked?(post)
    self.looks.exists?(post_id: post.id)
  end

  def self.search(input, id)
    return nil if input == ""
    User.where(['lastname LIKE? OR firstname LIKE?', "%#{input}%", "%#{input}%"] ).where.not(id: id).limit(10)
  end

  validates :firstname, presence: true
  validates :lastname, presence: true

  mount_uploader :avater, ImageUploader
  mount_uploader :timetable, ImageUploader
end
