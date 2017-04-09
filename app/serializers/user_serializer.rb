class UserSerializer < ActiveModel::Serializer
  type 'data'
  attributes :id, :first_name, :last_name, :username, :description, :email, :color
  has_one :rank
  belongs_to :avatar
  belongs_to :topic, class_name: 'favorite_topic'

end
