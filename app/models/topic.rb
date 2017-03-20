class Topic < ApplicationRecord
	has_many :tags
	has_many :questions
end
