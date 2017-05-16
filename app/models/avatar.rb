class Avatar < ApplicationRecord
	has_many :users
	mount_uploader :avatars, AvatarUploader	
	serialize :avatars, JSON
end
