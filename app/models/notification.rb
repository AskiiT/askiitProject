class Notification < ApplicationRecord
	belongs_to :user
	belongs_to :question
	validates_inclusion_of :read, in: 0..1

	def self.load_notifications(user_id, page = 1, per_page = 10)
		g=Notification.where("user_id = ?", user_id).order("notifications.read DESC").order("notifications.created_at DESC")
		g.paginate(:page => page,:per_page => per_page)
	end
end
