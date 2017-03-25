class Follower < ApplicationRecord
  belongs_to :followed, :class_name => :User
  belongs_to :follower, :class_name => :User

  validate :following_me

  def following_me
	   if followed_id && follower_id
		     if follower_id == followed_id
			        errors.add(:followed_id, "You can't follow yourself")
		     end
	   end
  end


end
