class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  mount_uploader :file, AvatarUploader
end
