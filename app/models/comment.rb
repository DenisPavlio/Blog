class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment
  belongs_to :commentable, :polymorphic => true
  default_scope -> { order('created_at ASC') }
  validates :comment, presence: true
  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user

  def date
    created_at.in_time_zone(2).strftime('%m/%d/%Y %H:%M')
  end
end
