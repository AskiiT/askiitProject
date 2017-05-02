class Notification < ApplicationRecord
	belongs_to :user
	belongs_to :question
	validates_inclusion_of :read, in: 0..1
end
