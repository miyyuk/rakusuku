class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :comments
  has_many :looks, dependent: :destroy
  has_many :post_files, dependent: :destroy
  accepts_nested_attributes_for :post_files

  validates :content, presence: true
end
