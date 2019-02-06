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

  private

  def name_rules
    splited = name.split
    if splited.size < 2
      errors.add(:base, 'Name must be at least 2 words')
    else
      errors.add(:base, 'Name words must be at least 2 letters') if splited[0].size < 2 || splited[1].size < 2
    end
    errors.add(:base, 'Name must be starts with a capital letter') unless name[0..0] =~ /[A-Z]/
    errors.add(:base, 'Name must contain the dot character "."') unless name.include? '.'
  end

end
