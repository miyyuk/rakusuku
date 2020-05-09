class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :content, presense: true
end
