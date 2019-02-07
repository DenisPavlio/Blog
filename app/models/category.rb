class Category < ApplicationRecord
  acts_as_commentable
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  validate :name_rules, on: [:create, :update]

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
