class Avatar < ApplicationRecord
	has_many :users
	mount_uploader :avatars, AvatarUploader
	mount_uploader :shirt, ShirtUploader
	
	serialize :avatars, JSON
	serialize :shirt, JSON
end
