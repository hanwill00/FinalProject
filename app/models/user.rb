class User < ApplicationRecord
  validate :first_name_cap, :last_name_cap, :email_at
  has_many :itineraries
  has_many :followers, through: :user_followings
  has_many :followees, through: :user_followings
  has_many :iterinary_followings
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  private

  def first_name_cap
    errors.add(:first_name, 'must be capitalized') if first_name && first_name.first.capitalize != first_name.first
  end

  def last_name_cap
    errors.add(:last_name, 'must be capitalized') if last_name && last_name.first.capitalize != last_name.first
  end

  def email_at
    errors.add(:email, 'must have an \'@\' and a \'.\'') if email && (!(email.include? '.') || !(email.include? '@'))
  end
end
