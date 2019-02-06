class Category < ApplicationRecord
  acts_as_commentable
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  validate :name_rules, on: [:create, :update]

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
