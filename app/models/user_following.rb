class UserFollowing < ApplicationRecord
  validate :follow_itself
  belongs_to :user
  belongs_to :follower
  belongs_to :followee
  validates :followee, uniqueness: { scope: :user }
  validates :follower, uniqueness: { scope: :user }

  private

  def follow_itself
    errors.add(:user, 'cannot follow itself') if user == followee
  end
end
