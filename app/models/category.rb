class Category < ApplicationRecord
  acts_as_commentable
  has_many :posts, dependent: :destroy
end
