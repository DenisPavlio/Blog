class Category < ApplicationRecord
  acts_as_commentable
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  validate :name_rules, on: [:create, :update]

  private

  def name_rules
    errors.add(:base, 'Category name must be at least 2 words') if name.split.size < 2
    errors.add(:base, 'Category name must be starts with a capital letter') unless name[0..0] =~ /[A-Z]/
    errors.add(:base, 'Category name must contain the dot character "."') unless name.include? '.'
  end
end
