class CreateUserFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :user_followings do |t|
      t.references :user, foreign_key: true
      t.references :follower
      t.references :followee

      t.timestamps
    end
  end
end
