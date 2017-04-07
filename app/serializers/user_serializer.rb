class UserSerializer < ActiveModel::Serializer
  type 'data'
  attributes :id, :first_name, :last_name, :username, :description, :email
  has_one :rank
end
