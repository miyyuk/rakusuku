class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :content, presence: true

  mount_uploaders :files, ImageUploader

end
