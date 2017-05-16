class SubscribedToTag < ApplicationRecord
  belongs_to :user
  belongs_to :tag
  validates_uniqueness_of :user, :scope => [:tag]


  def self.subscribedTo(tag)
  	g=where("tag_id = (?)", tag).select("user_id")
  	#User.where('id IN (?)', g)
  end

  def self.tagsWhereSubscribed(user)
  	g=where("user_id = (?)", user).select("tag_id")
  	Tag.where('id IN (?)', g)
  end
end
