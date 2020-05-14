class PostFile < ApplicationRecord
  belongs_to :post

  mount_uploader :file, ImageUploader
end
