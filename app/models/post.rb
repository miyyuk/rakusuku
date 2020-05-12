class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :comments
  has_many :looks, dependent: :destroy
  has_many :looked_users, through: :looks, source: :post

  validates :content, presence: true

  mount_uploaders :files, ImageUploader
end
