class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  mount_uploader :file, AvatarUploader

  validates_integrity_of :file
  validates :name, :content, presence: true
  validate :name_rules, on: [:create, :update]

  acts_as_commentable
  acts_as_votable

  def date
    updated_at.in_time_zone(2).strftime('%m/%d/%Y %H:%M')
  end

  private

  def name_rules
    return if name.nil?

    splited = name.split
    msg1 = 'Name must be at least 2 words'
    msg2 = 'First and second words must be at least 2 letters'
    msg3 = 'Name must be starts with a capital letter'
    msg4 = 'Name must contain the dot character "."'
    if splited.size < 2
      errors.add(:base, msg1)
    else
      errors.add(:base, msg2) if splited[0].size < 2 || splited[1].size < 2
    end
    errors.add(:base, msg3) unless name[0..0] =~ /[A-Z]/
    errors.add(:base, msg4) unless name.include? '.'
  end
end
