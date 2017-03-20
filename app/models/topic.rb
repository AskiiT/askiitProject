class Topic < ApplicationRecord
	has_many :tags
	has_many :questions
	has_many :domain_ranks
end
