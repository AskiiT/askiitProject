class Follower < ApplicationRecord
  belongs_to :followed, :class_name => :User
  belongs_to :follower, :class_name => :User

  validate :following_me
  validates_uniqueness_of :follower, :scope => [:followed]
  
  def following_me
	   if followed_id && follower_id
		     if follower_id == followed_id
			        errors.add(:followed_id, "You can't follow yourself")
		     end
	   end
  end

  def self.load_follows(page = 1, per_page = 10)
      includes(:follower, :followed).select("id, follower_id, followed_id")
      .paginate(:page => page,:per_page => per_page)
  end

end
