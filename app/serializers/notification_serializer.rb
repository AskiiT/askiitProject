class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :body, :read
end
