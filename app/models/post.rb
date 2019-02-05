class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  mount_uploader :file, AvatarUploader
  acts_as_commentable
  acts_as_votable

  def date
    updated_at.in_time_zone(2).strftime('%m/%d/%Y %H:%M')
  end
end
