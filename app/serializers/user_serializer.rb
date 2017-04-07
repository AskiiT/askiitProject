class UserSerializer < ActiveModel::Serializer
  type 'data'
  attributes :id, :first_name, :last_name, :username, :description
  has_one :rank
end
