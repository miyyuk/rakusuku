class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :comments

  validates :content, presence: true

  mount_uploaders :files, ImageUploader

end
