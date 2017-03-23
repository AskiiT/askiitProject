class Topic < ApplicationRecord
	has_many :tags
	has_many :questions
	has_many :domain_ranks

	validates :topic_name, presence: true
	validates :topic_name, uniqueness: true
	validates :topic_name, length: { minimum: 2, maximum: 20 }
	validates :tag_description, length: { minimum: 200 }
end
