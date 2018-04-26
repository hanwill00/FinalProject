class UserFollowing < ApplicationRecord
  validate :follow_itself
  belongs_to :user
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'
  validates :followee, uniqueness: { scope: :user }
  validates :follower, uniqueness: { scope: :user }

  private

  def follow_itself
    errors.add(:user, 'cannot follow itself') if user == followee
  end
end
