class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :posts
  has_many :comments

  validates :firstname, presence: true
  validates :lastname, presence: true

  mount_uploader :avater, ImageUploader
  mount_uploader :timetable, ImageUploader
end
