class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :posts
  acts_as_voter
  validates :name, presence: true

  validate :name_rules, on: [:create, :update]

  private

  def name_rules
    splited = name.split
    msg1 = 'Name must be at least 2 words'
    msg2 = 'Name words must be at least 2 letters'
    msg3 = 'First word in name must be starts with a capital letter'
    msg4 = 'Second word in name must be starts with a capital letter'
    msg5 = 'Name must contain the dot character "."'
    if splited.size < 2
      errors.add(:base, msg1)
    else
      errors.add(:base, msg2) if splited[0].size < 2 || splited[1].size < 2
    end
    errors.add(:base, msg3) unless splited[0][0..0] =~ /[A-Z]/
    errors.add(:base, msg4) unless splited[1][0..0] =~ /[A-Z]/
    errors.add(:base, msg5) unless name.include? '.'
  end
end
