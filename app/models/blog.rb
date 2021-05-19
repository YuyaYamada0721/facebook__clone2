class Blog < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :image, presence: true
  validates :content, presence: false
end
