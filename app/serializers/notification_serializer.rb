class NotificationSerializer < ActiveModel::Serializer
  attributes :body, :read, :user_id, :question_id
  belongs_to :question
end
