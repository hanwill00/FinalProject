require 'bcrypt'
class User < ApplicationRecord
  include BCrypt

  validate :first_name_cap, :last_name_cap, :email_at
  has_many :itineraries
  has_many :followers, through: :user_followings
  has_many :followees, through: :user_followings
  has_many :iterinary_followings
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def follow(followee)
    return if User_following.exists?(user: self, followee: followee) || Friendship.exists?(user: followee, followee: self)
    User_following.create(user: self, followee: followee)
    User_following.create(user: followee, followee: self)
  end

  def unfollow(followee)
    user_following1 = User_following.find_by(user: self, followee: followee)
    user_following1.destroy if user_following_1
    user_following2 = User_following.find_by(user: followee, followee: self)
    user_following2.destroy if user_following2
  end

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
