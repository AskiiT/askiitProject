class Picture < ApplicationRecord
	has_many	:domain_ranks
	mount_uploader :level_picture, LevelPictureUploader
	serialize :level_picture, JSON
end
