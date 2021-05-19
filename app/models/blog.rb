class Blog < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  belongs_to :user
end
