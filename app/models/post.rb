class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  mount_uploader :file, AvatarUploader
  acts_as_commentable
  acts_as_votable
end
